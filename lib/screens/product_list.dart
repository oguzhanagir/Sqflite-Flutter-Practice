import 'package:flutter/material.dart';
import 'package:sqfliteflutterpractice/data/dbHelper.dart';
import 'package:sqfliteflutterpractice/screens/product_add.dart';

import '../models/product.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State {
  DbHelper dbHelper = DbHelper();
  late List<Product> products;
  int productCount = 0;

  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data){
      this.products = data;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){goToProductAdd();},
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount ,
        itemBuilder: (BuildContext context,int position){
          return Card(
            color: Colors.indigoAccent,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.orangeAccent,child: Text("O"),),
              title: Text(this.products[position].name),
              subtitle: Text(this.products[position].description),

            ),
          );
        });
  }

  void goToProductAdd() async {
    await Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductAdd()));
  }
}
