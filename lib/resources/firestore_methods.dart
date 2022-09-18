import 'package:sirasogutler/models/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:sirasogutler/models/blog.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<String> addHistory(String transId, String checkHour, String exitHour,
  //     String datetime, userId) async {
  //   String res = 'some error occurred';

  //   try {
  //     String historyId = const Uuid().v1();

  //     Blog blog = History(
  //       transId: transId,
  //       checkHour: checkHour,
  //       exitHour: exitHour,
  //       datetime: datetime,
  //     );
  //     _firestore
  //         .collection("users")
  //         .doc(userId)
  //         .collection('history')
  //         .doc(historyId)
  //         .set(history.toJson());
  //     res = "succes";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  Future<String> addPoint(int cPoint, userId) async {
    String res = 'some error occurred';

    try {
      _firestore.collection("users").doc(userId).update({'point': cPoint});
      res = "succes";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updateMail(String email, userId) async {
    String res = 'some error occurred';

    try {
      _firestore.collection("users").doc(userId).update({'email': email});
      res = "succes";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updatePhone(String phone, userId) async {
    String res = 'some error occurred';

    try {
      _firestore.collection("users").doc(userId).update({'parentPhone': phone});
      res = "succes";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
