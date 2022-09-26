import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coordinator_app/attendance_api.dart';
import 'package:coordinator_app/create.dart';
import 'package:coordinator_app/details.dart';
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
      home:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Patient Queries"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(50,0,50,0),
               child: Container(
                 child: Image.asset('assets/images/abc.png'),
                  ),
             ),
            SizedBox(height: 60,),
            Center(
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  createPatient())),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffff9ca0),
                        Color(0xffffcfef),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  ),
                  width:300 ,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(70,9,0,0),
                    child: Text(
                        "Create Patient",
                    style: GoogleFonts.dosis(
                      fontSize: 28 ,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Pateintdetails())),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffa2c5fe),
                        Color(0xffc2e9fc),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  borderRadius: BorderRadius.circular(50),
                ),
                width:300, //MediaQuery.of(context).size.width * 0.65 ,
                height: 60,
                child:Padding(
                  padding: const EdgeInsets.fromLTRB(70,9,0,0),
                  child: Text(
                    "Patient Details",
                    style: GoogleFonts.dosis(
                      fontSize: 28 ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PatientTrack())),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffff9ca0),
                      Color(0xffffcfef),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                width:300, //MediaQuery.of(context).size.width * 0.65 ,
                height: 60,
                child:Padding(
                  padding: const EdgeInsets.fromLTRB(70,9,0,0),
                  child: Text(
                    "Patient Track",
                    style: GoogleFonts.dosis(
                      fontSize: 28 ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}



