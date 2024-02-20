import 'package:flutter/material.dart';

void main() {
  runApp(const ProductList());
}

class ProductList extends StatelessWidget {
  
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Product List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'image': 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/02b5819cd7bb4bfd8a3fa7fd012d9359_9366/Samba_Classic_Shoes_White_772109_04_standard.jpg', 
    'name': 'Samba classic shoes', 'price': '\$99'},
    {'image': 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/02b5819cd7bb4bfd8a3fa7fd012d9359_9366/Samba_Classic_Shoes_White_772109_04_standard.jpg', 
    'name': 'Samba classic shoes', 'price': '\$99'},

    {'image': 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/02b5819cd7bb4bfd8a3fa7fd012d9359_9366/Samba_Classic_Shoes_White_772109_04_standard.jpg', 
    'name': 'Samba classic shoes', 'price': '\$99'},

    {'image': 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/02b5819cd7bb4bfd8a3fa7fd012d9359_9366/Samba_Classic_Shoes_White_772109_04_standard.jpg', 
    'name': 'Samba classic shoes', 'price': '\$99'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hemendra'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.account_circle),
        //     onPressed: () {
        //     },
        //   ),
        // ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(products[index]['image']),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(products[index]['name']),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(products[index]['price'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
