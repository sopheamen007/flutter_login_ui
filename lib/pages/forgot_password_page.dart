import 'package:flutter/material.dart';

import '../color_theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _controllerEmail = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Icon(Icons.arrow_back_ios),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text("FORGOT PASSWORD",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: primary,
                controller: _controllerEmail,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)),
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        color: primary,
                        onPressed: () {
                          forgotPassword();
                        },
                        child: Text(
                          "DONE",
                          style: TextStyle(color: white),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }

  forgotPassword() {
    String emailField = _controllerEmail.text;
    if (emailField.isNotEmpty) {
      // process api here
      alertSample(emailField);
    }
  }

  Future<void> alertSample(email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('FORGOT PASSWORD'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('The verify code sent to $email'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
