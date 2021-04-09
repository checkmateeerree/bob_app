import 'package:bob/screens/menu/menu.dart';
import 'package:bob/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: Scaffold(
          appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(Icons.person),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              label: Padding(
                padding: const EdgeInsets.only(right:8.0, left: 0),
                child: Text('Sign Out', style: TextStyle(fontSize: 16.0),),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Menu()
          )
        ),
      ),
    );
  }
}
