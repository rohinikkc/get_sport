 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/booking_controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/payment_controller.dart';
import 'package:getsport/presentation/modules/academy/academy_account.dart';
import 'package:getsport/presentation/modules/academy/academy_home.dart';
import 'package:getsport/presentation/modules/academy/details_editpage.dart';
import 'package:getsport/presentation/modules/club/club_home.dart';
import 'package:getsport/presentation/modules/trainer/personal_detailpage.dart';

import 'package:getsport/presentation/modules/trainer/trainerhome.dart';
import 'package:getsport/presentation/modules/user/login_screen.dart';
import 'package:getsport/logic/firebase_options.dart';
import 'package:getsport/presentation/spash_screen.dart';
import 'package:provider/provider.dart';


Future<void> main()async

 {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PaymentController>(create: (_)=>PaymentController()),
          ChangeNotifierProvider<BookingController>(create: (_)=>BookingController())
          ,ChangeNotifierProvider<DBFunctions>(create: (_)=>DBFunctions())
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        
         home: SpashScreen (),
     
         ),
    );
  }
}

