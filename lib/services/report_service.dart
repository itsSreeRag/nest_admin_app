import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nest_admin_app/models/report_model.dart';


class ReportServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ReportModel>> fetchReportsByUserId() async {
    try {
      final snapshot = await _firestore.collection('reprot').get();

      return snapshot.docs
          .map((doc) => ReportModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }


    Future<void> updateReportStatus(
    String reportId,
    String newStatus,
  ) async {
    log(newStatus);
    final snapshot =
        await FirebaseFirestore.instance
            .collection('reprot').get();

    if (snapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('reprot')
          .doc(reportId).update({'status': newStatus});
    }
  }
}
