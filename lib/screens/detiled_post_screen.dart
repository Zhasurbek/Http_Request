import 'package:flutter/material.dart';
import 'package:http_post/constants/post_text_styles.dart';
import 'package:http_post/services/http_service.dart';
import 'package:http_post/models/post_model.dart';

class DetiledPostScreen extends StatelessWidget {
  final HttpService httpService = HttpService();
  final Post post;

  DetiledPostScreen({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Title',
                    style: xPostLableTextStyles,
                  ),
                  subtitle: Text(
                    post.title,
                    style: xPostDetileTextStyles,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Id',
                    style: xPostLableTextStyles,
                  ),
                  subtitle: Text(
                    "${post.id}",
                    style: xPostDetileTextStyles,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Body',
                    style: xPostLableTextStyles,
                  ),
                  subtitle: Text(
                    post.body,
                    style: xPostDetileTextStyles,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'UserId',
                    style: xPostLableTextStyles,
                  ),
                  subtitle: Text(
                    "${post.userId}",
                    style: xPostDetileTextStyles,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
