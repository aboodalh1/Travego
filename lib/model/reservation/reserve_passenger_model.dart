class Passenger {
  int passengerId;
  int tripReservation;
  String firstname;
  String lastname;
  String fathername;
  String mothername;
  DateTime birthdate;
  String nationality;
  String personalIdentityPhoto;
  DateTime passportIssueDate;
  DateTime passportExpiresDate;
  String passportNumber;
  String passportPhoto;
  String visaType;
  String visaCountry;
  DateTime visaIssueDate;
  DateTime visaExpiresDate;
  String visaPhoto;

  Passenger({
    required this.passengerId,
    required this.tripReservation,
    required this.firstname,
    required this.lastname,
    required this.fathername,
    required this.mothername,
    required this.birthdate,
    required this.nationality,
    required this.personalIdentityPhoto,
    required this.passportIssueDate,
    required this.passportExpiresDate,
    required this.passportNumber,
    required this.passportPhoto,
    required this.visaType,
    required this.visaCountry,
    required this.visaIssueDate,
    required this.visaExpiresDate,
    required this.visaPhoto,
  });
}