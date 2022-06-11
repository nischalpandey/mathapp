import 'package:flutter/material.dart';

class Reg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  String name = "";
  bool changeButton = false;
  bool show = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, "/");
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/img/login.png",
                  fit: BoxFit.cover,
                ),
                Text(
                  "Welcome,",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " $name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Full Name ",
                          labelText: "Full Name ",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Name cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: show,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (show == true) {
                                    show = false;
                                  } else {
                                    show = true;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: show,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (show == true) {
                                    show = false;
                                  } else {
                                    show = true;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Color.fromARGB(255, 27, 170, 113),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/reg");
                          },
                          child: Row(
                            children: [
                              Text("New user?"),
                              Text(
                                "Register",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
