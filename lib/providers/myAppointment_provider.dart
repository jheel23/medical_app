import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppointmentNotifier extends StateNotifier<Map<String, dynamic>> {
  MyAppointmentNotifier() : super({});
  Map<String, dynamic> get appointments => state;
  void addAppointment(Map<String, dynamic> appointment) {
    state = appointment;
  }

  void clearAppointment() {
    state = {};
  }
}

final myAppointmentProvider =
    StateNotifierProvider<MyAppointmentNotifier, Map<String, dynamic>>(
        (ref) => MyAppointmentNotifier());
