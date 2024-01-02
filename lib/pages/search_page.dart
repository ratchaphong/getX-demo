import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/cart_controller.dart';
import 'package:getx_example/models/comment_model.dart';

class SearchPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final CartController _cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    _searchController.text = '1'; // Set searchTerm to '1' initially
    _cartController.searchComment(postId: '1'); // Perform initial search
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Search Page'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Enter a search term',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final searchTerm = _searchController.text.trim();
                if (searchTerm.isNotEmpty) {
                  _cartController.searchComment(postId: searchTerm);
                }
              },
              child: const Text('Search'),
            ),
            Obx(() {
              final searchResults = _cartController.commentItems;
              if (searchResults.isEmpty) {
                return Container();
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final CommentModel item = searchResults[index];
                      final name = item.name;
                      final email = item.email;
                      return ListTile(
                        title: Text(name),
                        subtitle: Text(email),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
