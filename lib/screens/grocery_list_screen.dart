import 'package:flutter/material.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key});


  void _addItem(BuildContext context) { 
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return  NewItemScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery Items"),
        actions: [IconButton(onPressed: () {
          _addItem(context);
        }, icon: const Icon(Icons.add))],
      ),
      body: const GroceryList(),
    );
  }
}
