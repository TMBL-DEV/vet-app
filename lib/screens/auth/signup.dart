import 'package:flutter/material.dart';
import 'package:vetApp/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  String _email;
  String _password;
  SnackBar snackBar;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future register() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    dynamic result = await _auth.signup(_email, _password);
    if (result.toString() == "ERROR_EMAIL_ALREADY_IN_USE") {
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Email is already in use (try loging in)'),
        ),
      );
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
                "Registreer account",
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
                onPressed: () => register(),
                child: Text("registreer"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
