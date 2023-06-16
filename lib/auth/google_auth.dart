import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuth {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? email;
  String? imageUrl;
  String errorMsg = "";
  bool isLoggedIn = false;
  bool isLoading = false;


  void signOutGoogle() async {
    await googleSignIn.signOut();
    SharedPreferences.getInstance().then((value) {
      value.setString('googlename', "");
      value.setString('googleemail', "");
      value.setString('googleimage', "");
      value.setString('id', "");
      value.setString('name', "");
      value.setString('email', "");
      value.setString('logged', "false");
      value.setBool('premium', false);
    });

    if (kDebugMode) {
      print("User Sign Out");
    }
  }

  Future<bool> isSignedIn() async {
    return await googleSignIn.isSignedIn();
  }
}
