import 'package:app_ban_giay/module/generate_product/repository/generate_product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateProductScreen extends StatelessWidget {
  const GenerateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final futureItem = ref.watch(genProductProvider);
            return switch (futureItem) {
              AsyncData() => const Text("Tạo xong"),
              AsyncError(:final error) => Text('Error: $error'),
              _ => const CircularProgressIndicator(),
            };
          },
        ),
      ),
    );
  }
}
