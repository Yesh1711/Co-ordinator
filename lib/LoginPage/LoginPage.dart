import 'package:flutter/material.dart';

import '../HomePage/homePage.dart';

class LoginPage extends StatelessWidget {

  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  bool hidePassword=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25,),
              Text('Hello Co-ordinator!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Welcome back :)'),
              SizedBox(
                height: 40,
              ),
              Image(
                width: 300,
                height: 200,
                image: AssetImage('assets/images/logo4.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/forgot');
                      },
                      child: Text('Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple
                        ),),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: (){
                    if (_emailController.text == null) {
                      showSnackBar('Please proviide a valid email', context);
                      return;
                    }
                    if (!_emailController.text.contains('@')) {
                      showSnackBar(
                          'please provide a valid email address', context);
                      return;
                    }
                    if (!_emailController.text.contains('.com')) {
                      showSnackBar(
                          'please provide a valid email address', context);
                      return;
                    }
                    if (_passwordController.text == null) {
                      showSnackBar('The password is incorrect', context);
                      return;
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>HomePage() ,
                      ),
                    );
                    // signInWithEmailAndPassword() ;
                  },
                  child: Container(
                    height: 50,
                    child: Center(child: Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/signup');


                    },
                    child: Text(' Register Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),),
                  )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
void showSnackBar(title, context) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

