import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/repositories/grocery_repository.dart';

final groceryItemsControllerProvider = Provider((ref) {
  final groceryRepository = ref.watch(groceryRepositoryProvider);

  return GroceryItemsController(
      providerRef: ref, groceryRepository: groceryRepository);
});



final groceryProvider = FutureProvider((ref) {
  final groceryRepository = ref.watch(groceryRepositoryProvider);
  return groceryRepository.allGroceries();
});

class GroceryItemsController {
  final ProviderRef providerRef;
  final GroceryRepository groceryRepository;

  GroceryItemsController(
      {required this.providerRef, required this.groceryRepository});

      void addGrocery(GroceryItem item) {
        groceryRepository.addGrocery(item);

        // providerRef.invalidateSelf();
        providerRef.refresh(groceryProvider);
        
      }

  void removeGroery(GroceryItem item) {
    groceryRepository.removeGrocery(item);
      // providerRef.invalidateSelf();
    providerRef.refresh(groceryProvider);
  }
}
