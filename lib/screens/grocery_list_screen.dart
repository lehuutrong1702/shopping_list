import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class GroceryListScreen extends StatelessWidget {
  GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery Items"),
      ),
      body: GroceryList(),
    );
  }
}
