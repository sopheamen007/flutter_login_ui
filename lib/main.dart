import 'package:flutter/material.dart';
import 'package:login_screen/pages/forgot_password_page.dart';
import 'package:login_screen/pages/sign_up_page.dart';

void main() => runApp(
  MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

const primary = Color(0xffce4257);
const white = Color(0xffffffff);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
      );
  }
  Widget getBody(){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: primary
              ),
            ),
            SizedBox(height: 40,),
            TextField(
              cursorColor: primary,
              controller: _controllerEmail,
              decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primary)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primary)
                ),
                hintText: "Email",
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              obscureText: !isShowPassword,
              cursorColor: primary,
              controller: _controllerPassword,
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primary)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primary)
                ),
                suffixIcon: FlatButton(onPressed: (){
                 setState(() {
                   isShowPassword = !isShowPassword;
                 });
                }, child: Icon(isShowPassword ? Icons.visibility : Icons.visibility_off,color: primary,))
              ),
            ),
             SizedBox(height: 30,),
            InkWell(
              onTap: (){
                gotoForgotPassword();
              },
              child: Align(child: Text("Forgot Password?"),alignment: Alignment.centerRight,)),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Expanded(
                                  child: FlatButton(
              color: primary,
              onPressed: (){
              print("login action");
            }, child: Text("Login",style: TextStyle(color: white),)),
                )
              ],
            ),
            SizedBox(height: 30,),
            InkWell(
            onTap: (){
              goToSignUpPage();
            },  
            child: Align(child: Text("Dont have an account?"),alignment: Alignment.center,))
          ],
        ),
      )
    );
  }

  goToSignUpPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
  gotoForgotPassword(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }
 
}
