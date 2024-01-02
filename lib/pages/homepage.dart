import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _authController.logout();
              Get.offNamed('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            Obx(() {
              final userId = _authController.userId.value.toString();
              final userName = _authController.userName.value;
              return Column(
                children: [
                  Text('User ID: $userId'),
                  Text('Username: $userName'),
                  ElevatedButton(
                    onPressed: () {
                      // Get.toNamed('/carts/$userId');
                      Get.toNamed('/carts/1');
                    },
                    child: const Text('View Post'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get.toNamed('/carts/$userId/comments');
                      Get.toNamed('/carts/1/comments');
                    },
                    child: const Text('Comments'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/search');
                    },
                    child: const Text('Search'),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
