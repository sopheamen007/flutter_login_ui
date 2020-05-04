import 'package:flutter/material.dart';

import '../color_theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  final TextEditingController _controllerFullname = new TextEditingController();
  bool isShowPassword = false;
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
                height: 40,
              ),
              Text(
                "SIGN UP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(color: primary),
              ),
              SizedBox(
                height: 40,
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
              TextField(
                obscureText: !isShowPassword,
                cursorColor: primary,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                    suffixIcon: FlatButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: Icon(
                          isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primary,
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: primary,
                controller: _controllerFullname,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)),
                  hintText: "Fullname",
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
                          signUP();
                        },
                        child: Text(
                          "DONE",
                          style: TextStyle(color: white),
                        )),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
  signUP(){
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    String fullname = _controllerFullname.text;
    print("$email, $password, $fullname");
  }
}
