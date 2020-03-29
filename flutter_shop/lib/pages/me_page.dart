import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/Counter.dart';

class MePage extends StatelessWidget {

  List<String> list = [
    '我的订单',
    '我的账户',
    '我的积分',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',];

  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return  _createHeader();
            }
            else {
              return _createGrid(context);
            }
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provide.value<Counter>(context).increment(),
        tooltip: 'Provide 增加',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _createHeader() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createUserHeader(),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text('Flutter'),
            ),
          ],
        ),
    );
  }

  Widget _createUserHeader() {
    return Container(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FadeInImage.assetNetwork(
          placeholder: "images/十米桃花.jpeg",
          image: "https://upload.jianshu.io/users/upload_avatars/2420391/1f6fed41-25bb-41c3-81a7-ad47a52f292f.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createGrid(BuildContext context) {
      return GridView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
//            SliverGridDelegateWithFixedCrossAxisCount：用于固定列数的场景；
//            SliverGridDelegateWithMaxCrossAxisExtent：用于子元素有最大宽度限制的场景；
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          return _createItem(index);
        },
      );
  }

  Widget _createItem(int index) {
    return Container(
      color: Colors.orangeAccent,
      child: GestureDetector(
        child: Center(
          child: Text(list[index]),
        ),
        onTap: (){
          print('点击了 $index');
        },
      )
    );
  }
}