import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/grocery_item.dart';

final groceryRepositoryProvider = Provider((ref) {
  return GroceryRepository();
});

class GroceryRepository {
  List<GroceryItem> _groceries = [];

  void addGrocery(GroceryItem item) async {
    final url = Uri.https(
        'shoppinglist-5c796-default-rtdb.firebaseio.com', 'shopping-list.json');
    final res = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'name': item.name,
          'quantity': item.quantity,
          'category': item.category.title
        },
      ),
    );  

    final resData = json.decode(res.body);



    _groceries.add(GroceryItem(id: resData['name'], name: item.name, quantity: item.quantity, category: item.category));
  }

  void removeGrocery(GroceryItem item) {
    if (_groceries.contains(item)) {
      _groceries.remove(item);
    }
  }

  Future<List<GroceryItem>> initGroceries() async {
    final url = Uri.https(
        'shoppinglist-5c796-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    print(response.body);
    final Map<String, dynamic> listData = json.decode(response.body);

    List<GroceryItem> loadItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;

      loadItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }

    return loadItems;
  }

  Future<List<GroceryItem>> allGroceries() async {
    await Future.delayed(const Duration(milliseconds: 5000));

    if (_groceries.isEmpty) _groceries = await initGroceries();

    return _groceries;
  }
}
