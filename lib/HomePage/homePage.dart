import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../create.dart';
import 'NavBar.dart';

class HomePage extends StatelessWidget {
  int day=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Can-cer vive',
          style: TextStyle(
              color: Colors.amber
          ),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                color: Colors.black,),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bolt,
              color: Colors.yellow,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
            child: Text(
              '$day Days',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
          ),
        ],
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text('Hello,',
                            style: TextStyle(
                                fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('Co-ordinator',
                            style: TextStyle(
                                fontSize: 30
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEFEFEF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                    hintText: "Search for patients",
                    suffixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Color(0xffEFEFEF),
              //         borderRadius: BorderRadius.circular(14)
              //     ),
              //     child: Row(
              //       children: <Widget>[
              //         Icon(Icons.search),
              //         SizedBox(width: 10,),
              //         Text("Search", style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 19
              //         ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),



              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Profiles',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(builder: (context) => createPatient()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 25, 10, 4),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      'assets/images/pat3.png'
                                  ),
                                ),
                              ),
                              Text('Add new Patients',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),)

                            ],
                          ),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Colors.white,
                              boxShadow: [new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                              ),]
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const  EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 25, 10, 4),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                    'assets/images/p2.jpg'
                                ),
                              ),
                            ),
                            Text('Update Patients',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),)
                          ],

                        ),
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  Colors.deepPurple,
                            boxShadow: [new BoxShadow(
                              color: Color(0xff918fa5),
                              blurRadius: 10.0,
                            ),]
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Patient\'s Attendance',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                              'assets/images/patient.jpg'
                          ),
                        ),
                      ],
                    ),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                        ]
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Appointment Today',
                      style:TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: AppointmentCard(
                  onTap: (){

                  },
                ),
              ),
            ]
        ),
      ),



      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        animationDuration:Duration(milliseconds: 300),
        items: [
          Icon(Icons.settings),
          Icon(Icons.home),
          Icon(Icons.people),
          Icon(Icons.chat),
        ],
      ),

    );
  }
}
class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/p2.jpg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Patient: Mukesh',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'consultation',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.deepPurple[400],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[300],
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


// backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Patient Queries"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
//             child: Container(
//               child: Image.asset('assets/images/abc.png'),
//             ),
//           ),
//           SizedBox(
//             height: 60,
//           ),
//           Center(
//             child: InkWell(
//               onTap: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => createPatient())),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffff9ca0),
//                         Color(0xffffcfef),
//                       ],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     )),
//                 width: 300,
//                 height: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(70, 9, 0, 0),
//                   child: Text(
//                     "Create Patient",
//                     style: GoogleFonts.dosis(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           InkWell(
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => Pateintdetails())),
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffa2c5fe),
//                     Color(0xffc2e9fc),
//                   ],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               width: 300, //MediaQuery.of(context).size.width * 0.65 ,
//               height: 60,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(70, 9, 0, 0),
//                 child: Text(
//                   "Patient Details",
//                   style: GoogleFonts.dosis(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           InkWell(
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => PatientTrack())),
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffff9ca0),
//                     Color(0xffffcfef),
//                   ],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               width: 300, //MediaQuery.of(context).size.width * 0.65 ,
//               height: 60,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(70, 9, 0, 0),
//                 child: Text(
//                   "Patient Track",
//                   style: GoogleFonts.dosis(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),