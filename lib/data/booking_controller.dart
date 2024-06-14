import 'dart:developer';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/booking_model.dart';
import 'package:intl/intl.dart';

class BookingController with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final now = DateTime.now();



  BookingModel? _bookingModel;
  final auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  List<BookingModel> myBookings = [];

  late BookingService? mockBookingService;
  List<DateTimeRange> converted = [];
  String? _venueID;

  getMyBookingsForConvert() async {
    log(_venueID.toString());
    final snapshot = await db
        .collection("doctor")
        .doc(_venueID)
        .collection("bookings")
        .get();

    myBookings =
        snapshot.docs.map((e) => BookingModel.fromMap(e.data())).toList();
  }

  Future init(
    
      String doctorName, userName, venueId, userEmail,int amount) async {
    _venueID = venueId;
    mockBookingService = BookingService(
        userName: userName,
        servicePrice:amount, 
        serviceId: venueId,
        userId: auth.currentUser!.uid,
        userEmail: userEmail,
        // userPhoneNumber: whatsappnumber,
        bookingEnd: DateTime(now.year, now.month, now.day, 17, 30),
        bookingStart: DateTime(now.year, now.month, now.day, 9, 0),
        serviceName: doctorName,
        serviceDuration: 30);
  }

  // final tim = TimeOfDay.now();
  // final now="${tim.hour}"

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    getMyBookingsForConvert();
    converted = myBookings
        .where((element) => element.venueID == _venueID)
        .map((booking) => DateTimeRange(
            start: DateTime.parse(booking.bookingTime),
            end: DateTime.parse(booking.bookingEndTime)))
        .toList();
    log(converted.toString());

    return converted;
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 13, 0),
          end: DateTime(now.year, now.month, now.day, 14, 30))
    ];
  }

  Future<BookingService> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));

    log(converted.length.toString());
    String formatttedDate =
        DateFormat('dd-MM-yy').format(newBooking.bookingStart);
    print('////////////$formatttedDate/////////');
    return newBooking;
  }

  Future bookNewSchedule(BookingService newBooking) async {
    _bookingModel = BookingModel(
        status: "Pending",
        payment: "130",
        bookingid: newBooking.bookingStart.toString(),
        userName: newBooking.userName ?? 'unknown',
        bookingTime: newBooking.bookingStart.toString(),
        bookingEndTime: newBooking.bookingEnd.toString(),
        venueID: newBooking.serviceId.toString(),
        userid: newBooking.userId.toString(),
        email: newBooking.userEmail.toString(),
      );

 
    print('////////////${newBooking.serviceId}');
    await firebaseFirestore
        .collection('bookings')
        .doc(newBooking.serviceId)
        .collection('bookings')
        .doc(newBooking.bookingStart.toString())
        .set(_bookingModel!.toMap());
    await firebaseFirestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('bookings')
        .doc(newBooking.bookingStart.toString())
        .set(_bookingModel!.toMap());

    print('/////////Uploaded successfully');
  }




}
