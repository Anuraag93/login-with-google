import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter/model/user_entity.dart';
import 'package:rxdart/rxdart.dart';

class UserRepositoryFirestore {
  Firestore _firestore = Firestore.instance;

  Observable<List<UserEntity>> getUsers() {
    final Stream<List<UserEntity>> stream = _firestore
        .collection("users")
        .orderBy("name")
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((f) => UserEntity.fromDocument(f.data, f.documentID))
            .toList());
    return Observable(stream);
  }
}
