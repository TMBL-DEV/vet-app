import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateVetje extends StatefulWidget {
  @override
  _CreateVetjeState createState() => _CreateVetjeState();
}

class _CreateVetjeState extends State<CreateVetje> {
  String _name;
  String _fryingDuration;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Vetje aanmaken"),
      ),
      body: SafeArea(
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
                  "Vetje",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 28,
                  ),
                )),
                TextFormField(
                  onSaved: (String value) {
                    if (value.isEmpty) {
                      return "Naam is verplicht";
                    }
                    this._name = value;
                  },
                  decoration: InputDecoration(
                      icon: new Icon(Icons.food_bank),
                      labelText: "Naam van het vetje"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  onSaved: (String value) {
                    if (value.isEmpty) {
                      return "frituur tijdspan is verplicht";
                    }

                    this._fryingDuration = value;
                  },
                  decoration: InputDecoration(
                    icon: new Icon(Icons.timelapse),
                    labelText: "Tijds span in frituur (minuten)",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: 20.0),
                IconButton(
                  icon: new Icon(Icons.save),
                  onPressed: () {
                    print("saving");
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(_name);
                  },
                  color: Colors.green[800],
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
