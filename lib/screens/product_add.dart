
import 'package:flutter/material.dart';


class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }


}

class ProductAddState extends State{
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtUnitPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekleme Sayfası"),
      ),
      body: Column(
        children: [
          buildNameField(),
          buildDescriptionField(),
          buildUnitPriceField(),
        ],
      ),
    );

  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı"),
    );
  }

  buildDescriptionField() {}

  buildUnitPriceField() {}

}
