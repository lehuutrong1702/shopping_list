

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shopping_list/data/dummy_items.dart";


final groceryItemsProvider = Provider((ref) {
  return groceryItems;
}); 