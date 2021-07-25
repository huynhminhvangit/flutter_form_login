import 'package:flutter/material.dart';
import 'package:flutter_form_login/src/blocs/login_bloc.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc = LoginBloc();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  bool _isVisibility = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          height: height,
          color: Colors.white70,
          child: Form(
            key: _globalFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    child: FlutterLogo(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade100,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  StreamBuilder(
                    stream: _loginBloc.emailStream,
                    builder: (context, snapshot) => TextFormField(
                      validator: (value) => _isValid(value, 'EMAIL'),
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        hintText: 'example@mail.com',
                        labelStyle:
                            TextStyle(color: Colors.grey.shade500, fontSize: 18),
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: _loginBloc.passwordStream,
                    builder: (context, snapshot) => TextFormField(
                      validator: (value) => _isValid(value, 'PASSWORD'),
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      controller: _passwordController,
                      obscureText: _isVisibility,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 18),
                          hintText: '********',
                          suffixIcon: IconButton(
                            icon: Icon(_isVisibility
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: _onToggleShowPassword,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: _onSignIn,
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 20, bottom: 20),
                        child: Text('SIGN IN'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'NEW USER? ',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: _onSignUp,
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: _onForgetPassword,
                          child: Text(
                            'FORGET PASSWORD?',
                            style:
                                TextStyle(fontSize: 15, color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }

  _isValid(String? value, String type) {
    if(type == 'EMAIL') {
      return _loginBloc.isValidEmail(value!);
    }
    if(type == 'PASSWORD') {
      return _loginBloc.isValidPassword(value!);
    }
  }

  _onSignIn() {
    if (_globalFormKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: gotoHome));
    }
  }

  Widget gotoHome(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(primaryColor: Colors.blue.shade100),
      home: Home(),
    );
  }

  _onSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: gotoSignUp));
  }

  Widget gotoSignUp(BuildContext context) {
    return Home();
  }

  _onForgetPassword() {
    Navigator.push(context, MaterialPageRoute(builder: gotoForgetPassword));
  }

  Widget gotoForgetPassword(BuildContext context) {
    return Home();
  }

  _onToggleShowPassword() {
    setState(() {
      _isVisibility = !_isVisibility;
    });
  }
}
