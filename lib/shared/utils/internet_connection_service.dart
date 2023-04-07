import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionService {
  Future<bool> checker() async {
    return await InternetConnectionChecker().hasConnection;
  }

  Future<bool> checkerAndReturnPopUp({required BuildContext context}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      print('You are disconnected from the internet.');
    }
    return result;
  }
}
