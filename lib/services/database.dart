import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vetApp/services/vetjesResolver.dart';

class DataBaseService {
  final String uid;

  DataBaseService(this.uid);

  CollectionReference vetjesCollection =
      Firestore.instance.collection("vetjes");

  Future createUserVetjes(String name, int fryingTimeSpan) async {
    fryingTimeSpan = fryingTimeSpan * 60;
    this
        .vetjesCollection
        .document(this.uid)
        .setData({"name": name, "fryingDuration": fryingTimeSpan});
  }

  Stream<QuerySnapshot> get vetjes {
    return vetjesCollection.where("userId", isEqualTo: this.uid).snapshots();
  }

  VetjesResolver vetjesResolver() {
    return new VetjesResolver(this);
  }
}
