import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/following_circle.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          // width: double.infinity,
          color: Colors.red[200],
          child: ListView.builder(
              // padding: EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return FollowingCircle(user: user);
              }),
        ),
      ],
    );
  }
}
