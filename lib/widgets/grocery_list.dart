import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/providers/grocery_items_provider.dart';

class GroceryList extends ConsumerStatefulWidget {
  @override
  ConsumerState<GroceryList> createState() {
    return _GroceryListState();
  }
}

class _GroceryListState extends ConsumerState<GroceryList> {
  @override
  Widget build(BuildContext context) {
    final groceryItems = ref.watch(groceryItemsProvider);

    return ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(groceryItems[index].quantity.toString()),
          );
        });
  }
}
