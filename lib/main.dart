import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 82, 6, 212)),
        useMaterial3: true,
      ),
      home: const ProductListScreen(),
    );
  }
}

         //  صفحة قائمة المنتجات 
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(  
      appBar: AppBar( 
        title: const Text("قائمة المنتجات"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 33, 41),
        foregroundColor: const Color.fromARGB(255, 249, 249, 250),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('اختر منتجاً لشرائه:'),
            const SizedBox(height: 20),

            // المنتج الأول: Smart Phone
            ElevatedButton(
              onPressed: () async {
                // نمرر اسم المنتج الأول هنا
                final result = await Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProductDetailScreen(ProductName: "Smart Phone")),
                );
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
                }
              },
              child: const Text('شراء Smart Phone'),
            ),

            const SizedBox(height: 10), // مسافة بين الأزرار

            // المنتج الثاني: Laptop
            ElevatedButton(
              onPressed: () async {
                // نمرر اسم المنتج الثاني هنا
                final result = await Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProductDetailScreen(ProductName: "Laptop")),
                );
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
                }
              },
              child: const Text('شراء Laptop'),
            ),

            const SizedBox(height: 10),

            // المنتج الثالث: Headphones
            ElevatedButton(
              onPressed: () async {
                // نمرر اسم المنتج الثالث هنا
                final result = await Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProductDetailScreen(ProductName: "Headphones")),
                );
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
                }
              },
              child: const Text('شراء Headphones'),
            ),
          ],
        ),
      ),
    );
  }
}

         //  صفحة التفاصيل 
class ProductDetailScreen extends StatelessWidget {
  final String ProductName;
  const ProductDetailScreen({super.key, required this.ProductName});
@override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('صفحة تفاصيل المنتجات'),
              centerTitle: true,
               backgroundColor:Color.fromARGB(255, 3, 22, 28),
              foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(' انت الان في صفحة التفاصيل'),
            const SizedBox(height: 20),
            Text('المنتج المختار: $ProductName', style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            ElevatedButton(onPressed:(){
              Navigator.pop(context, "تم شراء المنتج بنجاح ($ProductName)");
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            
             child: const Text('تم الشراء والعودة  (Pop)'),
             )
          ],
        ),
      ),
    );
  }
}