import 'package:flutter/material.dart';
import 'edit_data.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.list, this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://192.168.121.2/crud_flutter/delete.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
    });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['nama_barang']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE", style: new TextStyle(color: Colors.white),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Home(),
              )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.white),),
          color: Colors.blue,
          onPressed: ()=> Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['nama_barang']}"),
      ),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Text(widget.list[widget.index]['nama_barang'], style: new TextStyle(fontSize: 20.0),),
                new Text("Code : ${widget.list[widget.index]['kode_barang']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Price : ${widget.list[widget.index]['harga']}", style: new TextStyle(fontSize: 20.0),),
                new Text("Stock : ${widget.list[widget.index]['stok']}", style: new TextStyle(fontSize: 20.0),),

                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit", style: new TextStyle(color: Colors.white),),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext contexr)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("Delete", style: new TextStyle(color: Colors.white),),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
