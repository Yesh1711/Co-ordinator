import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'create.dart';

class Pateintdetails extends StatefulWidget {
  const Pateintdetails({Key? key}) : super(key: key);

  @override
  State<Pateintdetails> createState() => _PateintdetailsState();
}
  Widget buildUser(User user) => ListTile(
    leading: CircleAvatar(child: Text(''),),
    title: Text('${user.name}'),
    subtitle: Text('${user.pass}'),
  );




  Stream<List<User>> readUser() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
class _PateintdetailsState extends State<Pateintdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users'),),
      body: StreamBuilder<List<User>>(
        stream: readUser(),
        builder: (context, snapshot){
            if(snapshot.hasError){
                return Text('Something went wrong! ${snapshot.error}');
              }
            else if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return ListView(
                    children: users.map(buildUser).toList(),
                    );
              }
            else{
              return const Center(child: CircularProgressIndicator());
            }
        }
      ),
    );

  }
}
