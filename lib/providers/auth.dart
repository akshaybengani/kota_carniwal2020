import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {

  bool authCheck;

  Future<void> isAuth() async {
    this.authCheck = await true;
  }

}