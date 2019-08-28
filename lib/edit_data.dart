import 'package:fifthapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({ this.list, this.index });


  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {


  TextEditingController controllerCode ;
  TextEditingController controllerName ;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;
  
  void showAlert(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Success !!"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK", style:  new TextStyle(color: Colors.white),),
          color: Colors.blue,
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }


  void editData(){
    var url = "http://192.168.121.2/crud_flutter/edit.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemname": controllerName.text,
      "itemcode": controllerCode.text,
      "itemprice": controllerPrice.text,
      "itemstock": controllerStock.text,
    });
  }
  @override
  void initState() { 
    controllerCode = new TextEditingController(text: widget.list[widget.index]['kode_barang']);
    controllerName = new TextEditingController(text: widget.list[widget.index]['nama_barang']);
    controllerPrice = new TextEditingController(text: widget.list[widget.index]['harga']);
    controllerStock = new TextEditingController(text: widget.list[widget.index]['stok']);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
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
                    "EDIT DATA",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=> new Home(),
                      )
                    );
                    showAlert();
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
