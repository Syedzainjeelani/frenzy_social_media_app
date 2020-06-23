import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/post_model.dart';

class PostsCarousal extends StatelessWidget {
  final pageController;
  final title;
  final List<Post> posts;
  PostsCarousal({this.pageController, this.title, this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 400,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: posts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return Container(
                  height: 400,
                  width: 300,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 2),
                            blurRadius: 6.0)
                      ]),
                );
              }),
        ),
      ],
    );
  }
}
