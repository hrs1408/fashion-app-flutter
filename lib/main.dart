import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/productProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider()),
        ],
        child: MaterialApp(
          title: 'Farmart',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const MyHomePage(title: 'Farmart'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getListProduct();
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 20))),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...productProvider.listProduct.map((e) {
              return Card(
                child: ListTile(
                  leading: Image.network(e.image!, width: 100, height: 100),
                  title: Text(e.title!),
                  subtitle: Text(e.price!,
                      style: const TextStyle(fontSize: 16, color: Colors.red)),
                ),
              );
            })
          ],
        ));
  }
}
