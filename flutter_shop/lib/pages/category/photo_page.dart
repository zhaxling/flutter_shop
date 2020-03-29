import 'package:flutter/material.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'camera_page.dart';
import 'package:provide/provide.dart';
import '../../provide/PhotoProvide.dart';

List<CameraDescription> cameras;

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> with LoadingDelegate {


  List images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片选择和拍照'),
      ),
      body:Container(
        color: Colors.orangeAccent,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: 500,
              child: Container(
                color: Colors.orange,
                child: _createListView(context),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 100,
              width: 125,
              height: 38,
              child: Container(
                color: Colors.red,
                child: IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: (){
                    print('相册选取');
                    pickAsset(PickType.all, context);
                  },
                ),
              ),
            ),
            Positioned(
              right: 50,
              bottom: 100,
              width: 125,
              height: 38,
              child: Container(
                color: Colors.red,
                child: IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: (){
                    print('拍照片');
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CameraPage();
                    }));
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _createListView(BuildContext con) {
    return Provide<PhotoProvide>(
      builder: (context, child, provide){
        if (provide.type == 0 && provide.assets != null) {
          return ListView.builder(
            itemCount: provide.assets.length,
              itemBuilder: (context, index) {
              return Container(
                child: Center(child: Text('有数据'),),
              );
              }
          );
        }
        else if (provide.type == 1 && provide.paths != null) {
          return ListView.builder(
              itemCount: provide.paths.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(child: Text(provide.paths[index]),),
                );
              }
          );
        }
        return ListView.builder(
          itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Center(child: Text('无数据'),),
              );
            }
        );
      },
    );
  }

  void pickAsset(PickType type, BuildContext context) async {
    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
        context: context,
      themeColor: Colors.green,
      padding: 1.0,// the title color and bottom color
      dividerColor: Colors.grey,// item padding
      disableColor: Colors.grey.shade300, // divider color
      itemRadio: 0.88,
      maxSelected: 9,// 最大多选
      provider: I18nProvider.chinese,
      rowCount: 5,
      textColor: Colors.white,
      thumbSize: 150,
      sortDelegate: SortDelegate.common,// default is common ,or you make custom delegate to sort your gallery
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
        checkColor: Colors.blue,
      ),// default is DefaultCheckBoxBuilderDelegate ,or you make custom delegate to create checkbox
      loadingDelegate: this,// if you want to build custom loading widget,extends LoadingDelegate [see example/lib/main.dart]
      badgeDelegate: const DefaultBadgeDelegate(),
      pickType: type,// all/image/video
//      photoPathList: pathList
    );
    Provide.value<PhotoProvide>(context).update(0, imgList);
//      pickType: type,
//      // all/image/video
//
//      List < AssetPathEntity > photoPathList,
//
//      /// when [photoPathList] is not null , [pickType] invalid .
//    );
  }

  @override
  Widget buildBigImageLoading(BuildContext context, AssetEntity entity, Color themeColor) {
    // TODO: implement buildBigImageLoading
    return Center(
      child: Container(
        width: 50.0,
        height: 50.0,
        child: CupertinoActivityIndicator(
          radius: 25.0,
        ),
      ),
    );
  }

  @override
  Widget buildPreviewLoading(BuildContext context, AssetEntity entity, Color themeColor) {
    // TODO: implement buildPreviewLoading
    return Center(
      child: Container(
        width: 50.0,
        height: 50.0,
        child: CupertinoActivityIndicator(
          radius: 25.0,
        ),
      ),
    );
  }

}
