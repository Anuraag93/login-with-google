import 'package:demo_flutter/model/user_entity.dart';
import 'package:demo_flutter/users_repository_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  UserBloc() {
    // final _repo = UserRepositoryFirestore();
    // _repo.getUsers().listen((users) => _userList.add(users));

    _userList.add([
      UserEntity((b) => b
        ..fullName = "Anurag Banger"
        ..id = 22112
        ..profilePic = "")
    ]);
  }

  final _userList = BehaviorSubject<List<UserEntity>>();
  Observable<List<UserEntity>> get userList => _userList.stream;

  void dispose() {
    _userList.close();
  }
}
