import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/auth_controller.dart';
import 'package:getx_example/controllers/cart_controller.dart';
import 'package:getx_example/pages/comments_page.dart';
import 'package:getx_example/pages/login_page.dart';
import 'package:getx_example/pages/post_page.dart';
import 'package:getx_example/pages/register_page.dart';
import 'package:getx_example/pages/homepage.dart';
import 'package:getx_example/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(CartController());

    return GetMaterialApp(
      title: 'Flutter GetX Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(name: '/carts/:postId', page: () => PostPage()),
        GetPage(name: '/carts/:postId/comments', page: () => CommentsPage()),
        GetPage(name: '/search', page: () => SearchPage()),
      ],
    );
  }
}
