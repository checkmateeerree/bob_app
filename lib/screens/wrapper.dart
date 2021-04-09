import 'package:bob/models/user.dart';
import 'package:bob/screens/authenticate/authenticate.dart';
import 'package:bob/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User_>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      print('hi');
      return Authenticate();
    } else {
      print(user);
      return Home();
    }
  }
}
