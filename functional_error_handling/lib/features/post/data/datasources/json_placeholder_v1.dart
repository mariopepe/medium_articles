import 'dart:convert';
import 'package:functional_error_handling/core/error_handling/error_handling.dart';
import 'package:functional_error_handling/features/post/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class JsonPlaceholderV1 {
  JsonPlaceholderV1({
    required this.httpClient,
  });

  final http.Client httpClient;

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await httpClient.get(
        Uri.https('jsonplaceholder.typicode.com', '/posts'),
      );

      if (response.statusCode == 200) {
        try {
          final List<PostModel> posts = [];
          final data = json.decode(utf8.decode(response.bodyBytes)) as List;

          for (int i = 0; i < data.length; i++) {
            posts.add(PostModel.fromJson(data[i]));
          }

          return posts;
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      if ((e is ServerException) || (e is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }
}
