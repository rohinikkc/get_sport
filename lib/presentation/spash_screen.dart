import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/academy/academy_home.dart';
import 'package:getsport/presentation/modules/club/club_home.dart';

import 'package:getsport/presentation/modules/trainer/trainerhome.dart';
import 'package:getsport/presentation/modules/user/bottom_navigation.dart';
import 'package:getsport/presentation/modules/user/login_screen.dart';
import 'package:getsport/presentation/modules/admin/ad_home.dart';
import 'package:getsport/presentation/widget/helper.dart';

class SpashScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  SpashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper.clearPreference(context);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Helper.getPreferences().then((credential) async {
        if (credential.isEmpty || credential == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        } else {
          if (credential == Helper.ADMINUID) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const AdminHome()),
                (route) => false);
          } else {
            final user = await db.collection("user").doc(credential).get();
            final club = await db.collection("Clubs").doc(credential).get();
            final coach = await db.collection("Coachs").doc(credential).get();
            final academy =
                await db.collection("Acadamy").doc(credential).get();

            if (user.exists) {
              // go to user page
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => Navigation(indexnum: 0)),
                  (route) => false);
            }

            if (club.exists) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => ClubHome()),
                  (route) => false);

              // go to club home
            }
            if (coach.exists) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => TrainerHome()),
                  (route) => false);

              // ==>coach home
            }

            if (academy.exists) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => AcademyHome()),
                  (route) => false);

              //==>academy home
            }
          }
          //Navigate to other modules
        }
      });
    });

    return const Scaffold(
      body: Center(
        child: Text("GETSPORT"),
      ),
    );
  }
}
