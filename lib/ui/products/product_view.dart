import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(children: [CategoriesButtons(), ProductsFilter()]),
      ),
    );
  }
}

class ProductsFilter extends StatelessWidget {
  const ProductsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: 100, itemBuilder: itemBuilder),
    );
  }
}

class CategoriesButtons extends StatelessWidget {
  const CategoriesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.category),
        Icon(Icons.category),
        Icon(Icons.category),
        Icon(Icons.category),
        Icon(Icons.category),
      ],
    );
  }
}
