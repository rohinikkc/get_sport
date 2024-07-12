import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/booking_controller.dart';
import 'package:getsport/presentation/modules/user/payment.dart';
import 'package:getsport/presentation/widget/payment_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class SlotePackagePage extends StatelessWidget {
  String name;
  String email;
  double amount;
  // String whatsappnumber;
  String venueID;
  String venueName;

  SlotePackagePage({
    super.key,
    required this.amount,
    required this.venueName,
    required this.venueID,
    required this.email,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 239, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        title: Text(
          "Booking",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Time Slots:",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 20)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<BookingController>(builder: (context, controller, child) {
            return Expanded(
              child: FutureBuilder(
                  future: controller.init(
                      venueName, name, venueID, email, amount.toInt()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return BookingCalendar(
                      selectedSlotTextStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      bookedSlotTextStyle: const TextStyle(color: Colors.white),
                      bookingService: controller.mockBookingService!,
                      getBookingStream: controller.getBookingStreamMock,
                      uploadBooking: ({required newBooking}) {
                        return controller
                            .uploadBookingMock(newBooking: newBooking)
                            .then((value) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                    bookingService: newBooking,
                                    amount: amount,
                                  )));
                        });
                      },
                      pauseSlots: controller.generatePauseSlots(),
                      convertStreamResultToDateTimeRanges:
                          controller.convertStreamResultMock,
                      pauseSlotText: 'BREAK',
                      hideBreakTime: false,
                      loadingWidget: const Text('Fetching data...'),
                      uploadingWidget:
                          const Center(child: CircularProgressIndicator()),
                      locale: 'en_US',
                      startingDayOfWeek: StartingDayOfWeek.tuesday,
                      wholeDayIsBookedWidget: const Text(
                          'Sorry, for this day everything is booked'),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}
