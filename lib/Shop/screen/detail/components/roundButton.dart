import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
 RoundButton({ this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
          color: Colors.blueGrey,
          minWidth: double.infinity,
          height: 50,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPress),
    );
  }
}
