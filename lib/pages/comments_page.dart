import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/cart_controller.dart';
import 'package:getx_example/models/comment_model.dart';

class CommentsPage extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());

  CommentsPage({super.key}) {
    final String? postId = Get.parameters['postId'];
    if (kDebugMode) {
      print(postId);
    }
    if (postId != null) {
      _cartController.getComment(postId: postId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Comments'),
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
          final cartItems = _cartController.commentItems;
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final CommentModel item = cartItems[index];
              final name = item.name;
              final email = item.email;
              return ListTile(
                title: Text(name),
                subtitle: Text(email),
              );
            },
          );
        }),
      ),
    );
  }
}
