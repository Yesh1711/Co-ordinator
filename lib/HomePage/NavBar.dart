// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
//
// class NavBar extends StatelessWidget {
//   String? photoUrl;
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Scaffold(body: _buildContext(context)));
//   }
//
//   BlocProvider<SettingsBloc> _buildContext(BuildContext context) {
//     return BlocProvider<SettingsBloc>(
//       create: (context) => SettingsBloc(),
//       child: BlocConsumer<SettingsBloc, SettingsState>(
//         buildWhen: (_, currState) => currState is SettingsInitial,
//         builder: (context, state) {
//           return _settingsContent(context);
//         },
//         listenWhen: (_, currState) => true,
//         listener: (context, state) {},
//       ),
//     );
//   }
//
//   Widget _settingsContent(BuildContext context) {
//     // final User? user = FirebaseAuth.instance.currentUser;
//     // final displayName = user?.displayName ?? "No Username";
//     // photoUrl = user?.photoURL ?? null;
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
//           child: Column(children: [
//             Stack(alignment: Alignment.topRight, children: [
//               Center(
//                 child: photoUrl == null
//                     ? CircleAvatar(backgroundImage: AssetImage(PathConstants.profile), radius: 60)
//                     : CircleAvatar(
//                   child: ClipOval(
//                       child: FadeInImage.assetNetwork(
//                         placeholder: PathConstants.profile,
//                         image: photoUrl!,
//                         fit: BoxFit.cover,
//                         width: 200,
//                         height: 120,
//                       )),
//                   radius: 60,
//                 ),
//               ),
//               TextButton(
//                   onPressed: () async {
//                     await Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountScreen()));
//                     // setState(() {
//                     //   photoUrl = user?.photoURL ?? null;
//                     // });
//                   },
//                   style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: ColorConstants.primaryColor.withOpacity(0.16)),
//                   child: Icon(Icons.edit, color: ColorConstants.primaryColor)),
//             ]),
//             SizedBox(height: 15),
//             Text(displayName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 15),
//             // SettingsContainer(
//             //   child: Text(TextConstants.reminder, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
//             //   withArrow: true,
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (_) => ReminderPage()));
//             //   },
//             // ),
//             SettingsContainer(
//               child: Text('Personal Information ',
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
//               onTap: () {
//               },
//             ),
//             SettingsContainer(
//               child: Text('Questionnaire',
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
//               onTap: () {
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Mcq()));
//               },
//             ),
//             SettingsContainer(
//                 onTap: () {}, child: Text(TextConstants.terms, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))),
//             SettingsContainer(
//                 child: Text(TextConstants.signOut, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
//                 onTap: () {
//                   AuthService.signOut();
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (_) => SignInPage()),
//                   );
//                 }),
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello"),
    );
  }
}
