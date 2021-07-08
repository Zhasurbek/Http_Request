import 'package:http_post/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  String postsUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    http.Response response = await http.get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw 'can\'t get post';
    }
  }
}
