class FVNotificationCenter {
  // 单例
  factory FVNotificationCenter() => _getInstance();
  static FVNotificationCenter get instance => _getInstance();
  static FVNotificationCenter _instance;
  FVNotificationCenter._internal();
  static FVNotificationCenter _getInstance() {
    if (_instance == null) {
      _instance = FVNotificationCenter._internal();
    }
    return _instance;
  }
  //创建通知中心
  List<FVNotificationModel> pool = [];

  //添加监听者方法（加入通知中心）
  void addObserver(String postName, dynamic key,void notification(dynamic value)) {
    FVNotificationModel model = FVNotificationModel.fromList([postName,key,notification]);
    pool.add(model);
  }

  //发送通知
  void postNotification(String postName, dynamic value) {
    /// 遍历拿到对应的通知，并执行
    pool.forEach((element) {
      if(element.postName == postName){
        element.notification(value);
      }
    });
  }
  /// 根据postName移除通知
  void removeOfName(String postName) {
    /// 线程安全，不可使用forEach执行添加、移除等操作
    pool.removeWhere((element) => element.postName == postName);
  }

  /// 根据key移除通知
  void removeOfKey(dynamic key){
    pool.removeWhere((element) => element.key == key);
  }
  /// 清空通知中心
  void removeAll(){
    pool.clear();
  }
}

/// 通知模型
class FVNotificationModel{
  String postName;
  dynamic key; /// 根据key标记是谁加入的通知，一般直接传widget就好
  Function(dynamic value) notification;
  /// 简单写一个构造方法
  FVNotificationModel.fromList(List list){
    this.postName = list.first;
    this.key = list[1];
    this.notification = list.last;
  }
}
