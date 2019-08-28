import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData(){
    var url="http://192.168.121.2/crud_flutter/create.php";

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "itemprice": controllerPrice.text,
      "itemstock": controllerStock.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                    hintText: "Item Code",
                    labelText: "Item Code",
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                    hintText: "Item Price",
                    labelText: "Item Price",
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                    hintText: "Item Stock",
                    labelText: "Item Stock",
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "ADD DATA",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
