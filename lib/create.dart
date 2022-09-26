import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class createPatient extends StatelessWidget {
  final controllerName = TextEditingController();
  final controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("create patient"),),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children:  [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: 'Name',
              suffixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            ),
            SizedBox(height: 24,),
            TextField(
              controller: controllerPass,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24,),
            ElevatedButton(
                onPressed:(){
                  final user = User(
                    name: controllerName.text,
                    pass: controllerPass.text,
                  );
                  createUser(user);
                  Navigator.pop(context);
                },
                child: Text('Create'))

          ],),
      ),
    );
  }
  Future createUser(User user) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String pass;

  User({this.id ='',required this.name,required this.pass});

  Map<String, dynamic> toJson() => {
    'id':id,
    'name':name,
    'pass':pass,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    pass: json['pass'],
  );
}

