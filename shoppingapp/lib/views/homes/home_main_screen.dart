import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shoppingapp/core.dart';
import 'package:shoppingapp/views/homes/cart_screen.dart';
import 'package:shoppingapp/views/homes/wallet_screen.dart';
import 'package:shoppingapp/views/homes/wishlist_screen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  var _currentIndex = 0;

  // list screens
  final List<Widget> _children = const [
    HomeScreen(),
    WishListScreen(),
    CartScreen(),
    WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HomeMain",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home, color: Colors.grey, size: 30),
              title: const Text("Home"),
              selectedColor: Colors.purpleAccent,
              unselectedColor: Colors.grey,
            ),

            /// wishlist
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border_outlined, color: Colors.grey, size: 30),
              title: const Text("Favorites"),
              selectedColor: Colors.purpleAccent,
              unselectedColor: Colors.grey,
            ),

            /// cart
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart, color: Colors.grey, size: 30),
              title: const Text("Cart"),
              selectedColor: Colors.purpleAccent,
              unselectedColor: Colors.grey,
            ),

            /// wallet
            SalomonBottomBarItem(
              icon: const Icon(Icons.wallet, color: Colors.grey, size: 30),
              title: const Text(
                "Wallet",
              ),
              selectedColor: Colors.purpleAccent,
              unselectedColor: Colors.grey,
            ),
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}
