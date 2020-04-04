import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/Counter.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('购物车'),),
      ),
      body:
        ListView.builder(
          itemCount: 27,
            itemBuilder: (context, index){
              return _createItem(index);
            },
        ),
//      Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text('Provide'),
//            Provide<Counter>(
//              builder: (context, child, counter){
//                return Text('${counter.value}',
//                  style: Theme.of(context).textTheme.display1,
//                );
//              },
//            )
//          ],
//        )
//      ),
    );
  }

  /// 生成item
  Widget _createItem(int index) {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 8.0,
              color: Colors.blueGrey[50],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 16.0, bottom: 10.0),
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Image(
                      image: AssetImage("images/十米桃花.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 16.0),
                      child: Text("唯品自营 | 【2020夏季新款】",),
                    ),
                    Container(
                      height: 32.0,
                      margin: EdgeInsets.only(left: 16.0, top: 5.0),
                      padding: EdgeInsets.only(left: 14.0, right: 14.0),
//                      color: Colors.orange,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: Colors.orange
                      ),
                      child: Center(
                        child: Text("牛仔中蓝 33"),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
  }
}