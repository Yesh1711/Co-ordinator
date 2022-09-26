import 'package:coordinator_app/attendance.dart';
import 'package:coordinator_app/attendance_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientTrack extends StatelessWidget {
  const PatientTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendees'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: UserFormWidget(
            onSavedUser: (user) async{
              await UserSheetApi.insert(user.toJson());
            }
        ),
      )
    );
  }
}

class UserFormWidget extends StatefulWidget {

  final ValueChanged<User> onSavedUser;

  const UserFormWidget({Key? key, required this.onSavedUser}) : super(key: key);

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerDate;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser(){
    controllerName = TextEditingController();
    controllerDate = TextEditingController();
  }


  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildName(),
        const SizedBox(height: 16,),
        buildDate(),
        const SizedBox(height: 16,),
        buildSubmit(),
      ],
    ),
  );
  Widget buildName() => TextFormField(
    controller: controllerName,
    decoration:  const InputDecoration(
      labelText: 'Name',
      border: OutlineInputBorder(),
    ),
    validator: (value) => value!= null && value.isEmpty? 'Enter Name': null,
  );

  Widget buildDate() => TextFormField(
    controller: controllerDate,
    decoration:  const InputDecoration(
      labelText: 'Date',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value!= null && value.isEmpty? 'Enter Name': null,
  );

  Widget buildSubmit() => ElevatedButton(
    onPressed: (){
      final form = formKey.currentState!;
      final isValid = form.validate();
      if(isValid){
        final user = User(name: controllerName.text, date: controllerDate.text);
        widget.onSavedUser(user);
      }
      controllerName.clear();
    },
      child:const Center(child: Text('Save')),
  );

}

