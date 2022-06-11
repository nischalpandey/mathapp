import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset('assets/img/login.png'),
          Text("Welcome"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Username",
                    hintText: "enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              obscureText: !this.show,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.security),
                labelText: "Password",
                hintText: "enter your password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                  onPressed: () {
                    setState(() {
                      this.show = !this.show;
                    });
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Text("Ligin"))
        ],
      ),
    );
  }
}
