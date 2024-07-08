
import 'package:flutter/material.dart';
import 'package:helloflutter/09_state_manager/Model/user_info.dart';

class KYUserViewModel extends ChangeNotifier {
  UserInfo _user;

  KYUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}