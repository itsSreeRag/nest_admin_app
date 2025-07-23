import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nest_admin_app/models/registration_model.dart';

class HotelRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<RegistrationModel>> streamHotelData() {
    return _firestore.collectionGroup('profile').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return RegistrationModel.fromJson(doc.data());
      }).toList();
    });
  }

  Future<List<RegistrationModel>> fetchHotelData() async {
    try {
      // This will fetch all documents from any "profile" subcollection across all "hotels"
      final snapshot = await _firestore.collectionGroup('profile').get();

      return snapshot.docs.map((doc) {
        return RegistrationModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch hotel data: $e');
    }
  }

  Future<void> updateVerificationStatus(
    String hotelUid,
    String newStatus,
  ) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('hotels')
            .doc(hotelUid)
            .collection('profile')
            .get();

    if (snapshot.docs.isNotEmpty) {
      final docId = snapshot.docs.first.id;
      await FirebaseFirestore.instance
          .collection('hotels')
          .doc(hotelUid)
          .collection('profile')
          .doc(docId)
          .update({'verificationStatus': newStatus});
    }
  }
}
