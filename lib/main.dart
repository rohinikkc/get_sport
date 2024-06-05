 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getsport/academy.dart';
import 'package:getsport/academy/academy_home.dart';
import 'package:getsport/academy/academy_home2.dart';
import 'package:getsport/academy/academy_menu.dart';
import 'package:getsport/academy/academy_reglist.dart';
import 'package:getsport/academy/academy_tournamentslist.dart';
import 'package:getsport/academy/academy_venuelist.dart';
import 'package:getsport/academy1.dart';
import 'package:getsport/admin/ad_academylist.dart';
import 'package:getsport/admin/ad_clublist.dart';
import 'package:getsport/admin/ad_home.dart';
import 'package:getsport/admin/ad_menu.dart';
import 'package:getsport/admin/ad_productlist.dart';
import 'package:getsport/admin/ad_sportlist.dart';
import 'package:getsport/admin/ad_trainerlist.dart';
import 'package:getsport/admin/add_academy.dart';
import 'package:getsport/admin/add_club.dart';
import 'package:getsport/admin/add_event.dart';
import 'package:getsport/admin/add_product.dart';
import 'package:getsport/admin/add_sport.dart';
import 'package:getsport/admin/add_trainer.dart';
import 'package:getsport/admin/add_venue.dart';
import 'package:getsport/admin/admin_login.dart';
import 'package:getsport/auth/forgot.dart';
import 'package:getsport/booking.dart';
import 'package:getsport/auth/create_acnt.dart';
import 'package:getsport/club/club_account.dart';
import 'package:getsport/club/club_home.dart';
import 'package:getsport/club/club_home2.dart';
import 'package:getsport/club/club_menu.dart';
import 'package:getsport/club/club_register.dart';
import 'package:getsport/club/club_tournment.dart';
import 'package:getsport/event.dart';
import 'package:getsport/firebase_options.dart';

// import 'package:getsport/trainer/notification.dart';
import 'package:getsport/trainer/trainer_home.dart';
import 'package:getsport/trainer/trainer_notification.dart';
import 'package:getsport/trainer/traineraccount.dart';
import 'package:getsport/trainer/trainerchat.dart';
import 'package:getsport/trainer/trainerchatview.dart';
import 'package:getsport/trainer/trainermenu.dart';
import 'package:getsport/user/eventview.dart';

import 'package:getsport/user/homepage.dart';
import 'package:getsport/venueview.dart';
import 'package:getsport/auth/login_screen.dart';
import 'package:getsport/user/menubar.dart';
import 'package:getsport/user/orderconfirmed.dart';
import 'package:getsport/user/payment.dart';
import 'package:getsport/user/prductdet.dart';
import 'package:getsport/user/product_buy.dart';
import 'package:getsport/user/products.dart';
import 'package:getsport/screens/backgroundcolour.dart';
import 'package:getsport/user/search.dart';
import 'package:getsport/venue.dart';
 

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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
       home: LoginScreen (),
    //  home: ForgotPswrd(),
        //  home:HomePage(),
        // home: Pagethree(),
      //  home: Menu(),
      // home:Products(), 
        //  home:Search(),
        // home: Event(),
        // home: EventView(),
        //  home: Booking(),
        // home: Payment(),
        //  home: Products(),
        // home: Productdetails(),
        //  home: ProductBuy(),
        // home: OrderConfirm(),
      //  home: Academy(),
      //  home: Academypg1(),
      //  home: Search(),
      //  home: TrainerHome(),
      //  home: TrainerNot(),
      // home: Account(),
    //  home: TrainerChat(),
    // home: TrainerChatview(),
    //home: TrainerMenu(),
    // home: TrainerAccount(),
    // home: AdminLogin(),
    //  home: AdminHome(),
   // home: Ad_menu(),
    // home:AcademyList(),
    //  home: TrainerList(),
   // home: ClubList(),
    // home: ProductList(),
    // home: SportList(),
          // home: AddAcademy(),
          // home: AddProduct(),
          // home: AddTrainer(),
          // home: AddEvent()
          // home: AddSport(),
          // home: AddVenue(),
          // home: AddClub( ),
          // home: AcademyHome(),
          //  home:AcademyHomepage(),
         // home: AcademyReglist(),
    // home: AcademyMenu(),
    // home: AcademyTournament(),
    // home: AcademyVenuelist(),
 // home: ClubHome(),
// home: ClubHomepage( ),
// home: ClubAccount(),
// home: ClubMenu(),
//  home:ClubTournament(),
// home: ClubRegister(),    
       );
  }
}

