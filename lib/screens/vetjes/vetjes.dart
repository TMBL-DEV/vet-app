import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetApp/models/User.dart';
import 'package:vetApp/models/Vetje.dart';
import 'package:vetApp/services/database.dart';

class Vetjes extends StatefulWidget {
  @override
  _VetjesState createState() => _VetjesState();
}

class _VetjesState extends State<Vetjes> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    DataBaseService dbService = new DataBaseService(user.uid);

    return StreamBuilder(
      stream: dbService.vetjes,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Text("waiting");
        }
        List<Vetje> vetjes = dbService.vetjesResolver().resolveVetjes(snapshot);
        return ListView.builder(
          itemCount: vetjes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(vetjes[index].name),
              subtitle:
                  Text((vetjes[index].fryingDuration / 60).toString() + " min"),
            );
          },
        );
      },
    );

    // return SafeArea(
    //   child: Column(
    //     children: [
    //       SizedBox(height: 30.0),
    //       Center(
    //         child: Text(
    //           "hallo",
    //           style: TextStyle(
    //             color: Colors.grey[900],
    //             fontSize: 28,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
