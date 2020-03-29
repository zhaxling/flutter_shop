import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/Counter.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Provide'),
            Provide<Counter>(
              builder: (context, child, counter){
                return Text('${counter.value}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        )
      ),
    );
  }
}