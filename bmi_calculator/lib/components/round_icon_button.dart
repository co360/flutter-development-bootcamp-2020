import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData buttonIcon;
  final Function onPressed;
  RoundIconButton({this.buttonIcon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(buttonIcon, color: Colors.white),
    );
  }
}
