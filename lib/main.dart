import 'package:adr/get/product_screen_getx.dart';
import 'package:adr/riverpod/product_screen_riverpod.dart';
import 'package:adr/stateful/product_statetul_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

const String url = "https://dummyjson.com/products";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductStatefulScreen(),
                      )),
                  child: const Text("Route to Stateful")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreenGetx(),
                      )),
                  child: const Text("Route to GetX")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreenRiverpod(),
                      )),
                  child: const Text("Route to Riverpod")),
            ],
          ),
        ),
      ),
    );
  }
}
