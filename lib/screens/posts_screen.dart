import 'package:flutter/material.dart';
import 'package:http_post/models/post_model.dart';
import 'package:http_post/services/http_service.dart';
import 'package:http_post/constants/post_text_styles.dart';
import 'package:http_post/screens/detiled_post_screen.dart';

HttpService httpService = HttpService();

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;

            return ListView(
                children: posts
                    .map(
                      (Post post) => Card(
                        child: ListTile(
                          title: Text(
                            post.title,
                            style: xMainScreenPostLableTextStyles,
                          ),
                          subtitle: Text(
                            post.id.toString(),
                            style: xPostDetileTextStyles,
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetiledPostScreen(
                                post: post,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList());
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        },
      ),
    );
  }
}
