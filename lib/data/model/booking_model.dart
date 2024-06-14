class BookingModel {
  String bookingid;
  String userName;
  String email;

  String bookingTime;
  String bookingEndTime;

  String venueID;
  String userid;
  String status;
  String payment;

  BookingModel({
    required this.email,
    required this.bookingid,
    required this.userName,
    required this.bookingTime,
    required this.bookingEndTime,
    required this.venueID,
    required this.userid,
    required this.status,
    required this.payment
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      payment:map["payment"] ,status:map["status"] ,
      email: map["email"],
      bookingid: map['bookingid'],
      userName: map['userName'],
      bookingTime: map['bookingTime'],
      bookingEndTime: map['bookingEndTime'],
      venueID: map['venueID'],
      userid: map['userid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status':status,
      'payment':payment,
      'email': email,
      'bookingid': bookingid,
      'userName': userName,
      'bookingTime': bookingTime,
      'bookingEndTime': bookingEndTime,
      'venueID': venueID,
      'userid': userid,
    };
  }
}