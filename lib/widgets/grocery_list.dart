import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/controllers/grocery_items_controller.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryList extends ConsumerWidget {
  const GroceryList({super.key});

  void _removeItem(GroceryItem item, WidgetRef ref) {
    final notifier = ref.read(groceryItemsControllerProvider);
    notifier.removeGroery(item);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("rebuilt");

    return ref.watch(groceryProvider).when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, trace) => Center(child: Text(error.toString())),
        data: (groceryItems) => ListView.builder(
            itemCount: groceryItems.length,
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: ValueKey(groceryItems[index].id),
                onDismissed: (direction) {
                  _removeItem(groceryItems[index], ref);
                },
                child: ListTile(
                  title: Text(groceryItems[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: groceryItems[index].category.color,
                  ),
                  trailing: Text(groceryItems[index].quantity.toString()),
                ),
              );
            }));
  }
}
