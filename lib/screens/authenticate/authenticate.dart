import 'package:auto_size_text/auto_size_text.dart';
import 'package:bob/screens/authenticate/register.dart';
import 'package:bob/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to B.O.B.'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:60.0),
                child: Image(
                  image: NetworkImage(
                      'https://i.ibb.co/YDg7pgN/sports-pic-removebg-preview.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: AutoSizeText(
                    'Box Of Balls',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: AutoSizeText(
                    'The Next Generation of Sports Accessiblity',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      'We provide easy to use sports equipment to borrow, ',
                      style: TextStyle(fontSize: 14.0),
                      maxLines: 1,
                    ),
                    AutoSizeText("for free.",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold))
                  ]),
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 20,
                      minimumSize: Size(300, 50),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[100], width: 1.5),
                      primary: Colors.white,
                      elevation: 20,
                      minimumSize: Size(300, 50),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
