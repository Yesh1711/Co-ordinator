import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coordinator_app/HomePage/homePage.dart';
import 'package:coordinator_app/attendance_api.dart';
import 'package:coordinator_app/create.dart';
import 'package:coordinator_app/details.dart';
import 'package:coordinator_app/onBoardingPage/IntroPage.dart';
import 'package:coordinator_app/patient_track.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetApi.init();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home:IntroPage()));
}





