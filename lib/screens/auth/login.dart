import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vetApp/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future login() async {
    print("saving");
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    dynamic result = await _auth.signin(_email, _password);
    if (result && result == "ERROR_EMAIL_ALREADY_IN_USE") {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Form(
        key: _formKey,
        child: Container(
          width: 350,
          child: Column(
            children: [
              SizedBox(height: 40.0),
              Center(
                  child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 28,
                ),
              )),
              SizedBox(height: 10.0),
              TextFormField(
                onSaved: (String value) {
                  if (value.isEmpty) {
                    return "Email is verplicht";
                  }
                  this._email = value;
                },
                decoration: InputDecoration(
                    icon: new Icon(Icons.email),
                    labelText: "example@example.com"),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                onSaved: (String value) {
                  if (value.isEmpty) {
                    return "wachtwoord is verplicht";
                  }

                  this._password = value;
                },
                decoration: InputDecoration(
                  icon: new Icon(Icons.lock),
                  labelText: "Wachtwoord69420!",
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => login(),
                child: Text("login"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
