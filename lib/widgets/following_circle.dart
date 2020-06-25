import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';

class UserCircle extends StatelessWidget {
  final User user;
  final double width;
  final double height;
  UserCircle({this.user, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0, 2), blurRadius: 6.0),
        ],
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image(
              width: width,
              height: height,
              image: AssetImage(user.profileImageUrl),
              fit: BoxFit.cover)),
    );
  }
}
