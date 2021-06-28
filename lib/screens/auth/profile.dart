import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetApp/models/User.dart';
import 'package:vetApp/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();

    return SafeArea(
        child: Center(
      child: Container(
        width: 350,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "e-mail",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.userName != null ? user.userName : "John doe",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                child: Text("logout"),
                onPressed: () async {
                  print("logout");
                  _auth.signOut();
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
