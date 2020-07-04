import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  final Color bgcolor;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.bgcolor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
