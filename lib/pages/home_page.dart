import 'package:flutter/material.dart';
import 'package:hive_task2/model/user_model.dart';
import 'package:hive_task2/pages/create_page.dart';
import 'package:hive_task2/services/db_service.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    // Object ni Databasega Map qilib saqlash
    var user = User(email: email, password: password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(7, 127, 123, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/girl1.jpg"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 127, 123, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: FlatButton(
                            onPressed: () {
                              _doLogin();
                            },
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(LineAwesomeIcons.facebook_f),
                              color: Color.fromRGBO(66, 103, 178, 1),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(LineAwesomeIcons.twitter, size: 25),
                              color: Color.fromRGBO(19, 182, 250, 1),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(LineAwesomeIcons.instagram, size: 25),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don`t have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateAccount()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(7, 127, 123, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
