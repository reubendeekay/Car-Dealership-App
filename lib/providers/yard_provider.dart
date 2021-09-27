import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vehicle_management/models/yard_model.dart';

class YardProvider with ChangeNotifier {
  List<YardModel> _yardList = [];
  List<YardModel> get yardList => _yardList;

  Future<void> addYard(YardModel yard) async {
    final id = FirebaseFirestore.instance.collection('yard').doc().id;
    await FirebaseFirestore.instance.collection('yards').doc(id).set({
      'id': id,
      'name': yard.name,
      'location': yard.location,
      'carsAvailable': yard.availableCarIds,
      'manager': yard.manager,
      'employees': yard.employeeIds,
      'imageUrl': yard.image,
      'createdAt': FieldValue.serverTimestamp(),
      'transactionIds': yard.transactionIds,
    });

    notifyListeners();
  }

  Future<void> getYards() async {
    final yards = await FirebaseFirestore.instance.collection('yards').get();
    List<YardModel> _yards = [];
    _yards.addAll(yards.docs
        .map((e) => YardModel(
              availableCarIds: e['carsAvailable'],
              transactionIds: e['transactionIds'],
              employeeIds: e['employees'],
              name: e['name'],
              location: e['location'],
              manager: e['manager'],
              image: e['imageUrl'],
            ))
        .toList());
    _yardList = _yards;
    notifyListeners();
  }
}
