import 'package:cake_app/data/models/cake_model.dart';
import 'package:cake_app/data/repository/cake_repository.dart';
import 'package:flutter/material.dart';

class AddCakeScreen extends StatefulWidget {
  const AddCakeScreen({super.key});

  @override
  State<AddCakeScreen> createState() => _AddCakeScreenState();
}

class _AddCakeScreenState extends State<AddCakeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _recipeController;
  late TextEditingController _imageController;
  late TextEditingController _descriptionController;
  late CakeRepository repository = CakeRepository();
  String size = CakeSize.g500;

  @override
  void initState() {
    repository = repository;
    _nameController = TextEditingController();
    _recipeController = TextEditingController();
    _imageController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Cake"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Name"),
            controller: _nameController,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(hintText: "Description"),
            controller: _descriptionController,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(hintText: "Image URL"),
            controller: _imageController,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(hintText: "Recipe"),
            controller: _recipeController,
          ),
          const SizedBox(height: 16),
          DropdownButton(
            items: CakeSize.all
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            value: size,
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  size = value;
                }
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_imageController.text.trim().isNotEmpty &&
                    _recipeController.text.trim().isNotEmpty &&
                    _nameController.text.trim().isNotEmpty &&
                    _descriptionController.text.trim().isNotEmpty) {
                  repository.insertCake(
                    Cake(
                      image: _imageController.text.trim(),
                      name: _nameController.text.trim(),
                      recipe: _recipeController.text.trim(),
                      description: _descriptionController.text.trim(),
                      size: size,
                      isFavourite: false,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please enter full details")));
                }
              },
              child: const Text("Add Cake")),
        ],
      ),
    );
  }
}
