import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

Future<void> showToast() async {
  await Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: "Feature is under development",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xff10217D),
      textColor: Colors.white,
      fontSize: 16.0);
}

String dateformatter(DateTime date) {
  // ?Formatting the date----->>>>>>>>
  DateTime now = date;
  var formatter = DateFormat('dd-MM-yy');
  var formattedDate = formatter.format(now);
  return formattedDate;
}
