import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class RemoteServices {
  Future <List<Post>?> getPosts() async {
      var client = http.Client();

      // Parsing the url of API
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(uri);

      // This condition is to check whether the response is success and to share the successfully retrieved data
      if (response.statusCode == 200){
        //We will be using List<Post> postFromJson(String str) => List<Post> of Post.dart returns List of type post
        var json = response.body;

        return postFromJson(json);
      }

  }
}