

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shopping_list/data/dummy_items.dart";
import "package:shopping_list/models/grocery_item.dart";



class GroceryItemsNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryItemsNotifier() : super(groceryItems) ;


  void addNewGroceryItem(GroceryItem item) {
      state = [...state,item];
  }
  
}

final groceryItemsProvider =StateNotifierProvider<GroceryItemsNotifier,List<GroceryItem>>((ref) {
  return GroceryItemsNotifier();
}); 