import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/cart_controller.dart';

class PostPage extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());

  PostPage({super.key}) {
    final String? postId = Get.parameters['postId'];
    if (kDebugMode) {
      print(postId.runtimeType);
      print(postId);
    }
    if (postId != null) {
      _cartController.getPost(postId: postId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Post'),
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _cartController.clearComment();
              Get.offNamed('/homepage');
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          final post = cartController.post.value;
          if (post == null) {
            return const Text('No post available');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${post.userId}'),
                Text('ID: ${post.id}'),
                Text('Title: ${post.title}'),
                Text('Body: ${post.body}'),
              ],
            );
          }
        }),
      ),
    );
  }
}
