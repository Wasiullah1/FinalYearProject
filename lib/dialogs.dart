// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Dialogs {
  information(
      BuildContext context,
      String title,
      String Description,
      String bar,
      String appname,
      String Version,
      String Developer_name,
      String companyName) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(Description),
                  Text(bar),
                  Text(appname),
                  Text(Version),
                  Text(Developer_name),
                  Text(companyName)
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              )
            ],
          );
        });
  }
}
