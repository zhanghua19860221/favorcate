import 'package:flutter/material.dart';
import 'favor_content.dart';
import 'package:favorcate/core/FVNotificationCenter/fv_notificationCenter.dart';


class HYFavorScreen  extends StatefulWidget {
  static const String routeName = "/favor";

  @override
  _HYFavorScreenState createState() => _HYFavorScreenState();
}

class _HYFavorScreenState extends State<HYFavorScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 加入通知中心
    FVNotificationCenter().addObserver("favor",widget,(value){
      print("接收到通知：$value");
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: HYFavorContent(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    /// 移除名字为postName的所有通知
    FVNotificationCenter().removeOfName("favor");
    /// 移除标记为key的所有通知，一般在dispose()调用
    FVNotificationCenter().removeOfKey(widget);
  }
}