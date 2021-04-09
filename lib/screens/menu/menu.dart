import 'package:auto_size_text/auto_size_text.dart';
import 'package:bob/services/retrieve_locations.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BobModel _bobModel = BobModel();
  List nearbyBobs = [];
  int bobsAreFound;
  String postalCode = '';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: AutoSizeText(
                        "Find a B.O.B. near you!",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                        child: Container(
                            width: 300,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter Zipcode',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your zipcode';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                setState(() {
                                  postalCode = val;
                                });
                              },
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Center(
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 20,
                          ),
                          onPressed: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
                              // Process data.
                              List allBobs = await _bobModel.getAllBobs();
                              List firstNearbyBobs = [];
                              allBobs.forEach((bob) {
                                if (bob['postalCode'] == postalCode) {
                                  firstNearbyBobs.add(bob);
                                }
                              });
                              setState(() {
                                nearbyBobs = firstNearbyBobs;
                                if (nearbyBobs.length == 0) {
                                  bobsAreFound = 0;
                                } else {
                                  bobsAreFound = 1;
                                }
                              });
                            }
                          },
                          child: const Text('Search',
                              style: TextStyle(fontSize: 22.0)),
                        ),
                      ),
                    ),
                  ),
                  bobsAreFound == 1
                      ? Container(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "B.O.B.'s Near You:",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                    children: nearbyBobs
                                        .map((item) => Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  print('hi');
                                                },
                                                child: Text(
                                                    item['address']
                                                            .replaceAllMapped(
                                                                RegExp(
                                                                    r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
                                                                (Match m) =>
                                                                    "${m[0][0].toUpperCase()}${m[0].substring(1).toLowerCase()}")
                                                            .replaceAll(
                                                                RegExp(
                                                                    r'(_|-)+'),
                                                                ' ') +
                                                        ': ' +
                                                        item['city'] +
                                                        ', ' +
                                                        item['state'],
                                                    style: TextStyle(
                                                        fontSize: 16.0)),
                                              ),
                                            ))
                                        .toList()),
                              ],
                            ),
                          ),
                        )
                      : bobsAreFound == 0
                          ? Container(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "No B.O.B.'s Found.",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          : Visibility(
                              // showing the child widget
                              visible: false,
                              child: Text(
                                "two",
                              ),
                            ),
                  
                ],
              ),
            )));
  }
}
