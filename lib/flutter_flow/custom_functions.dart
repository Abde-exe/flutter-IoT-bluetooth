import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<DateTime>? createDateTimeList() {
  List<DateTime> dateTimeList = [];

  // Récupérer la date et l'heure actuelles
  DateTime now = DateTime.now();

  // Ajouter la première valeur (heure actuelle)
  dateTimeList.add(now);

  // Ajouter les valeurs suivantes avec un intervalle de 10 secondes
  for (int i = 1; i < 10; i++) {
    DateTime nextTime = now.add(Duration(seconds: i * 10));
    dateTimeList.add(nextTime);
  }

  return dateTimeList;
}
