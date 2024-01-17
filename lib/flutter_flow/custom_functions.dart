import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String newCustomFunction(
  String number,
  String? bank,
) {
  // check if the bank is Bank of Baroda then return LOST C with extracting last 4 digits of the number
  if (bank == 'Bank of Baroda') {
    String lastFourDigits = number!.substring(number.length - 4);
    return 'LOST C $lastFourDigits';
  } else if (bank == "Central Bank of India") {
    return "LOST $number";
  } else if (bank == "Canara Bank") {
    return "CAN HOTLISTCD $number";
  } else if (bank == "State Bank of India") {
    String lastFourDigits = number!.substring(number.length - 4);
    return 'BLOCK $lastFourDigits';
  } else if (bank == "Fino Payments Bank") {
    return "CARDBLOCK";
  } else if (bank == "Axis Bank") {
    String lastFourDigits = number!.substring(number.length - 4);
    return 'BLOCK $lastFourDigits';
  } else if (bank == "IDFC First Bank") {
    String lastFourDigits = number!.substring(number.length - 4);
    return 'SMS CCBLOCK $lastFourDigits';
  }

  return "LOST $number";
}
