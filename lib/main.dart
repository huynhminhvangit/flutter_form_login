import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Login',
      theme: ThemeData(
        primaryColor: Colors.blue.shade100,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          height: height,
          color: Colors.white70,
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
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 22),
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  hintText: 'example@mail.com',
                  labelStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 18),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 22),
                controller: passwordController,
                obscureText: isVisibility,
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 18),
                    hintText: '********',
                    suffixIcon: IconButton(
                      icon: Icon(isVisibility
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isVisibility = !isVisibility;
                        });
                      },
                    )),
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
                onPressed: () {},
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'FORGET PASSWORD?',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
