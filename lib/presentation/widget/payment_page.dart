import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/buy_product_model.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/data/model/regis_event_model.dart';
import 'package:getsport/data/payment_controller.dart';
import 'package:getsport/presentation/modules/user/bottom_navigation.dart';
import 'package:getsport/presentation/modules/user/orderconfirmed.dart';
import 'package:getsport/presentation/modules/user/product_buy.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:upi_india/upi_exception.dart';
import 'package:upi_india/upi_response.dart';


class PaymentPage extends StatefulWidget {
  BuyProductModel? buyProductModel;//only for buy product
  RegEventModel ?regEventModel;//only for registration evebts
  String ?eventId;//only for events registration
  double amount;
  PaymentPage(
      {super.key,
       this.eventId,
      this.regEventModel,
       this.buyProductModel ,
      required this.amount,
    });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final now = DateTime.now();
  Future<UpiResponse>? transaction;
  @override
  Widget build(BuildContext context) {


    setState(() {});

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CupertinoColors.black,
      ),
      body: Column(children: [
        Container(
          color: CupertinoColors.black,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Payment',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Make payment',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        FutureBuilder(
          future: PaymentController().initializeUpiIndia(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      PaymentController()
                          .initiateTransaction(context,
                              app: snapshot.data![index],
                              receiverUpiId: Helper.recieverUPIID,
                              receiverName: "Weigh Master",
                              amount: widget.amount)
                          .then((value) async {
                      
                      }).catchError((error) {
                     if(widget.buyProductModel!=null){
                         DBFunctions().buyAProduct(widget.buyProductModel!);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const OrderConfirm()));
                     }
                     if(widget.regEventModel!=null){
                      DbController().registerAnEvent(widget.eventId, widget.regEventModel!);
                      Helper.successSnackBar(context, "Event Registration succesful");
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (conetxt)=>Navigation(indexnum: 0)), (route) => false);
                     }
;                       
                        log("Error");
                      });
                      log("out");
                    },
                    leading: Image.memory(snapshot.data![index].icon),
                    title: Text(
                      snapshot.data![index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            );
          },
        ),
        FutureBuilder(
            future: transaction,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(_upiErrorHandler(snapshot.error.runtimeType),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ));
                }
                UpiResponse upiResponse = snapshot.data!;

                String txnId = upiResponse.transactionId ?? 'N/A';
                String resCode = upiResponse.responseCode ?? 'N/A';
                String txnRef = upiResponse.transactionRefId ?? 'N/A';
                String status = upiResponse.status ?? 'N/A';
                String approvalRef = upiResponse.approvalRefNo ?? 'N/A';
                _checkTxnStatus(status);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      displayTransactionData('Transaction Id', txnId),
                      displayTransactionData('Response Code', resCode),
                      displayTransactionData('Reference Id', txnRef),
                      displayTransactionData('Status', status.toUpperCase()),
                      displayTransactionData('Approval No', approvalRef),
                    ],
                  ),
                );
              }

              return const Text(
                "",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              );
            }),
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              )),
          Flexible(
              child: Text(
            body,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }
}