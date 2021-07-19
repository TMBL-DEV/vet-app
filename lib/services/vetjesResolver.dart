import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vetApp/models/Vetje.dart';
import 'package:vetApp/services/database.dart';

class VetjesResolver {
  final DataBaseService _database;

  VetjesResolver(this._database);

  // todo function that returns array with models
  // ignore: missing_return
  List<Vetje> resolveVetjes(AsyncSnapshot vetjes) {
    List<Vetje> resolvedVetjes = [];

    if (vetjes.hasData) {
      List<DocumentSnapshot> items = vetjes.data.documents;

      items.forEach((vetje) {
        var data = vetje.data;
        resolvedVetjes.add(
          new Vetje(
            userId: data["userId"],
            name: data["name"],
            fryingDuration: data["fryingDuration"],
          ),
        );
      });
    }

    return resolvedVetjes;
  }
}
