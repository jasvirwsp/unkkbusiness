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

double stringToDouble(String stringValue) {
  // create string value to double value.
  return double.parse(stringValue);
}

DocumentReference docIDtoRef(String serviceID) {
  // convert serviceId to document referance
  return FirebaseFirestore.instance.collection('services').doc(serviceID);
}
