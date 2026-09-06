import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/services/product_service.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final categoriesProvider = FutureProvider<List<Category>>((ref) {
  final service = ref.watch(productServiceProvider);
  return service.getCategories();
});

class SelectedCategoryNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void selectCategory(String? slug) {
    state = (state == slug) ? null : slug;
  }
}

final categorySelectionProvider =
    NotifierProvider<SelectedCategoryNotifier, String?>(
      SelectedCategoryNotifier.new,
    );

final productProvider = FutureProvider<List<Product>>((ref) {
  final service = ref.watch(productServiceProvider);
  final slug = ref.watch(categorySelectionProvider);

  return slug == null
      ? service.getProducts()
      : service.getProductsByCategory(slug);
});

final productByIdProvider = FutureProvider.family<List<Product>, int>((
  ref,
  id,
) {
  final service = ref.watch(productServiceProvider);
  return service.getProductById(id);
});
