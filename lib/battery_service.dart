import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BatteryService {
  final Battery _battery = Battery();
  StreamSubscription<BatteryState>? _batterySubscription;

  void initialize() {
    _batterySubscription = _battery.onBatteryStateChanged.listen(_updateBatteryStatus);
  }

  void dispose() {
    _batterySubscription?.cancel();
  }

  void _updateBatteryStatus(BatteryState state) async {
    int batteryLevel = await _battery.batteryLevel;

    if ( batteryLevel >= 55) {
      _showToast("Battery level has reached 50%");
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG, //use LENGTH_LONG for android
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 10,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
