
import 'package:helloflutter/09_state_manager/Model/counter_view_model.dart';
import 'package:helloflutter/09_state_manager/Model/user_info.dart';
import 'package:helloflutter/09_state_manager/Model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/*
注意：这里的类型是 SingleChildWidget。（耽误了2天。。。）
因为 Provider 继承自 SingleChildWidget。
*/
List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (cxt) => KYCounterViewModel()),
  ChangeNotifierProvider(create: (cxt) => KYUserViewModel(UserInfo("tom", 29,"abc")))
];