import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectProvider with ChangeNotifier{
  Connectivity connectivity=Connectivity();
  bool _isCheck=false;
  bool get isCheck=>_isCheck;

  void check(){
    connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.mobile || event==ConnectivityResult.wifi){
        log("connected");
        _isCheck=true;
      }
      else{
        log("disconnected");
        _isCheck=false;
      }

    });
    notifyListeners();

  }
}