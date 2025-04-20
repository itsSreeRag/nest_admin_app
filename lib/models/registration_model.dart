class RegistrationModel {
  // Identity & Status
  final String uid;
  final String? profileImage;
  final String? verificationSatus;

  // Contact Info
  final String contactNumber;
  final String email;

  // Location
  final String city;
  final String state;
  final String country;
  final String pincode;

  // Property Details
  final String stayName;
  final String accommodationType;
  final String propertyType;
  final bool entireProperty;
  final bool privateProperty;
  final bool restaurantInsideProperty;
  final bool parking;

  // Business Details
  final String hasRegistration;
  final String panNumber;
  final String propertyNumber;
  final String gstNumber;

  // Preferences
  final String? selectedYear;
  final bool freeCancellation;
  final bool coupleFriendly;

  // Images
  final List<String> images;

  RegistrationModel({
    // Identity
    required this.uid,
    this.profileImage,
    this.verificationSatus,

    // Contact Info
    required this.contactNumber,
    required this.email,

    // Location
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,

    // Property Details
    required this.stayName,
    required this.accommodationType,
    required this.propertyType,
    required this.entireProperty,
    required this.privateProperty,
    required this.restaurantInsideProperty,
    required this.parking,

    // Business Details
    required this.hasRegistration,
    required this.panNumber,
    required this.propertyNumber,
    required this.gstNumber,

    // Preferences
    required this.selectedYear,
    required this.freeCancellation,
    required this.coupleFriendly,

    // Images
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'profileImage': profileImage,
      'verificationSatus': verificationSatus,
      'contactNumber': contactNumber,
      'email': email,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'stayName': stayName,
      'accommodationType': accommodationType,
      'propertyType': propertyType,
      'entireProperty': entireProperty,
      'privateProperty': privateProperty,
      'restaurantInsideProperty': restaurantInsideProperty,
      'parking': parking,
      'hasRegistration': hasRegistration,
      'panNumber': panNumber,
      'propertyNumber': propertyNumber,
      'gstNumber': gstNumber,
      'selectedYear': selectedYear,
      'freeCancellation': freeCancellation,
      'coupleFriendly': coupleFriendly,
      'images': images,
    };
  }

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      // Identity
      uid: json['uid'] ?? '',
      profileImage: json['profileImage'],
      verificationSatus: json['verificationSatus'],

      // Contact Info
      contactNumber: json['contactNumber'] ?? '',
      email: json['email'] ?? '',

      // Location
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      pincode: json['pincode'] ?? '',

      // Property Details
      stayName: json['stayName'] ?? '',
      accommodationType: json['accommodationType'] ?? '',
      propertyType: json['propertyType'] ?? '',
      entireProperty: json['entireProperty'] ?? false,
      privateProperty: json['privateProperty'] ?? false,
      restaurantInsideProperty: json['restaurantInsideProperty'] ?? false,
      parking: json['parking'] ?? false,

      // Business Details
      hasRegistration: json['hasRegistration'] ?? '',
      panNumber: json['panNumber'] ?? '',
      propertyNumber: json['propertyNumber'] ?? '',
      gstNumber: json['gstNumber'] ?? '',

      // Preferences
      selectedYear: json['selectedYear'],
      freeCancellation: json['freeCancellation'] ?? false,
      coupleFriendly: json['coupleFriendly'] ?? false,

      // Images
      images: List<String>.from(json['images'] ?? []),
    );
  }
}
