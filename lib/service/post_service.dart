import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:state_managment/model/post_model.dart';

class PostService {
  Dio dio = Dio();
  late Response response;
  String baseUrl = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<PostModel>> fetchPosts() async {
    response = await dio.get(baseUrl);
    return compute(parsePosts, jsonEncode(response.data));
  }

  static List<PostModel> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  }
}
