import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_example/models/comment_model.dart';
import 'package:getx_example/models/post_model.dart';

class CartController extends GetxController {
  final Dio _dio = Dio();
  final RxList<CommentModel> commentItems = <CommentModel>[].obs;
  final Rx<Post?> post = Rx<Post?>(null);

  Future<void> getPost({String postId = ""}) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$postId';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final post = Post.fromJson(data);
        this.post.value = post;

        if (kDebugMode) {
          print(this.post);
        }
      } else {
        if (kDebugMode) {
          print('API request failed with status code: ${response.statusCode}');
          print('Error message: ${response.data}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }

  Future<void> getComment({String postId = ""}) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> commentList = response.data;
        final List<CommentModel> comments =
            commentList.map((json) => CommentModel.fromJson(json)).toList();
        commentItems.assignAll(comments);

        if (kDebugMode) {
          print(commentList);
          print(commentItems);
        }
      } else {
        if (kDebugMode) {
          print('API request failed with status code: ${response.statusCode}');
          print('Error message: ${response.data}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }

  Future<void> searchComment({String postId = ""}) async {
    const url = 'https://jsonplaceholder.typicode.com/comments';
    final queryParameters = {
      'postId': postId,
    };

    try {
      final response = await _dio.get(url, queryParameters: queryParameters);

      if (response.statusCode == 200) {
        final List<dynamic> commentList = response.data;
        final List<CommentModel> comments =
            commentList.map((json) => CommentModel.fromJson(json)).toList();
        commentItems.assignAll(comments);

        if (kDebugMode) {
          print(commentList);
          print(commentItems);
        }
      } else {
        if (kDebugMode) {
          print('API request failed with status code: ${response.statusCode}');
          print('Error message: ${response.data}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }

  void clearComment() {
    commentItems.value = [];
    post.value = null;
  }
}
