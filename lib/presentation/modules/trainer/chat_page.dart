import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/chating_controller.dart';
import 'package:getsport/data/model/message_model.dart';
import 'package:getsport/presentation/modules/trainer/sendpage.dart';

class ChatPage extends StatelessWidget {
  String receiverID;
  String recieverName;
  String recieverProfile;
  ChatPage(
      {super.key,
      required this.receiverID,
      required this.recieverName,
      required this.recieverProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          actions: [
            recieverProfile == ""
                ? const SizedBox()
                : CircleAvatar(
                    backgroundImage: NetworkImage(recieverProfile),
                  ),
            const SizedBox(
              width: 10,
            )
          ],
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(recieverName),
          )),
      body: StreamBuilder<QuerySnapshot>(
          stream: CommunicationController()
              .getMessage(FirebaseAuth.instance.currentUser!.uid, receiverID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<MessageModel> listOFMessages = snapshot.data!.docs
                .map((e) =>
                    MessageModel.fromJson(e.data() as Map<String, dynamic>))
                .toList();

            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: listOFMessages.length,
                    itemBuilder: (context, index) =>
                        message(listOFMessages[index])),
              );
            } else {
              return const SizedBox();
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 400, bottom: 10),
              child: TextField(
                controller: _controller,
                decoration:
                    const InputDecoration(hintText: 'Type your message'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: TextButton(
                onPressed: () {
                  CommunicationController()
                      .sendMessage(receiverID, _controller.text);
                  _controller.clear();
                },
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 20, color: Colors.blue.shade900),
                )),
          ),
        ],
      ),
    );
    //  body:
  }

  TextEditingController _controller = TextEditingController();
  message(MessageModel messageModel) {
    bool isMe = messageModel.senderID == FirebaseAuth.instance.currentUser!.uid;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueGrey : Colors.blue,
          borderRadius: isMe
              ? const BorderRadius.horizontal(left: Radius.elliptical(20, 10))
              : const BorderRadius.horizontal(right: Radius.elliptical(20, 10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            messageModel.message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
