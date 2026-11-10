
import 'package:flutter/material.dart';
import 'studentInterface.dart';
import 'data.dart';

class StudentSignUpPage extends StatefulWidget {
  @override
  _StudentSignUpPageState createState() =>
      _StudentSignUpPageState();
}

class _StudentSignUpPageState extends State<StudentSignUpPage> {
  final nameControl = TextEditingController();
  final emailControl = TextEditingController();
  final numberControl = TextEditingController();
  final passwordControl = TextEditingController();

  Padding inputBox(
      String t, TextEditingController myController, bool pass) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 350,
        height: 70,
        child: TextField(
          controller: myController,
          obscureText: pass,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey),
            hintText: t,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameControl.dispose();
    emailControl.dispose();
    numberControl.dispose();
    passwordControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 20),
                child: Text(
                  'Hello Student,',
                  style: blackHeader,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'We need your information to \nkeep everyone safe',
                  style: mediumGreyText,
                  textAlign: TextAlign.center,
                ),
              ),

              inputBox("Full Name", nameControl, false),
              inputBox("Email Address", emailControl, false),
              inputBox("Mobile Number", numberControl, false),
              inputBox("Password", passwordControl, true),

              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 5),
                child: Text(
                  "Please enter a minimum of eight characters",
                  textAlign: TextAlign.left,
                  style: smallText,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        Pallete.studetGreen,
                        Pallete.mainBlue,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StudentSelectPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Ready to Scoop",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "By submitting you agree to our terms and conditions",
                  textAlign: TextAlign.center,
                  style: madSmallText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
