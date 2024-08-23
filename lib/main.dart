import 'package:flutter/material.dart';
import 'package:learn/Pages/CartPage.dart';
import 'package:learn/Pages/ShopPage.dart';
import 'package:learn/Pages/SplashPage.dart';
import 'package:learn/models/myproduct_database.dart';
import 'package:learn/models/shop.dart';
import 'package:learn/themes/lightMode.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyproductDatabase.initialize();
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: const SplashPage(),
        routes: {
          "/Shop_Page": (context) => const ShopPage(),
          "/Splash_Page": (context) => const SplashPage(),
          "/Cart_Page": (context) => const CartPage(),
        });
  }
}
