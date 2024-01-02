import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterPage({super.key}) {
    init();
  }

  void init() {
    usernameController.text = "tester";
    passwordController.text = "1q2w3e4r";
    addressController.text = "Chocolate Factory";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Register Page'),
      // ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Register Page'),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // ตรวจสอบว่า value ไม่ใช่ null และไม่ว่าง
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // ตรวจสอบว่า value ไม่ใช่ null และไม่ว่าง
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // ตรวจสอบว่า value ไม่ใช่ null และไม่ว่าง
                      return 'Please enter an address';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final username = usernameController.text;
                    final password = passwordController.text;
                    final address = addressController.text;
                    _authController.register(username, password, address);
                  }
                },
                child: const Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
