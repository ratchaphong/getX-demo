import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_example/models/user_model.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();
  RxBool isLoggedIn = false.obs;
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxInt userId = 0.obs;
  RxString userName = "".obs;

  Future<void> login(String username, String password) async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final data = {
      'username': username,
      'password': password,
    };

    try {
      final response = await _dio.post(url, data: data);

      if (response.statusCode == 201) {
        final user = User.fromJson(response.data);

        if (kDebugMode) {
          print(response.data);
          print(user.toJson());
        }
        isLoggedIn.value = true;
        this.username.value = username;
        this.password.value = password;
        userId.value = user.id;
        userName.value = user.username;
        Get.offNamed('/homepage');
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

  Future<void> register(
      String username, String password, String address) async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final data = {
      'username': username,
      'password': password,
      'address': address,
    };

    try {
      final response = await _dio.post(url, data: data);

      if (response.statusCode == 201) {
        final user = User.fromJson(response.data);

        if (kDebugMode) {
          print(response.data);
          print(user.toJson());
        }

        this.username.value = user.username;
        this.password.value = user.password;
        Get.offNamed('/login');
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

  void logout() {
    isLoggedIn.value = false;
    username.value = "";
    password.value = "";
  }
}
