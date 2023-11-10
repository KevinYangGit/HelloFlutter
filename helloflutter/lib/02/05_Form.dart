import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: MyForm(),
    );
  }
}

/*
验证表单
*/

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // 1.创建 GlobalKey
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey, // 2.设置GlobalKey，用户获取FormState
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: "用户名或手机号",
            ),
            validator: (value) {
              return value?.length == 0 ? "用户名不能为空" : null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "请输入密码",
            ),
            validator: (value) {
              return (value?.length ?? 0) < 6
                  ? "密码长度不能小于6位"
                  : null; // 4.验证表单子控件
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              child: Text(
                "登 录",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                print("登录");
                registerFormKey.currentState?.validate(); // 3.验证表单
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
Form 表单
*/

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             decoration: InputDecoration(
//               icon: Icon(Icons.person),
//               labelText: "用户名或手机号",
//             ),
//           ),
//           TextFormField(
//             obscureText: true,
//             decoration: InputDecoration(
//               icon: Icon(Icons.lock),
//               labelText: "密码",
//             ),
//           ),
//           SizedBox(height: 20), // 输入框和按钮的间距
//           Container(            // 按钮
//             width: double.infinity,
//             height: 44,
//             child: ElevatedButton(
//               child: Text(
//                 "登 录",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//               onPressed: () {
//                 print("登录");
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
FromState.save 获取表单数据
*/

// class _MyFormState extends State<MyForm> {
//   final registerFormKey = GlobalKey<FormState>(); // 1.创建标识
//   late String username, password;

//   void registerForm() {
//     registerFormKey.currentState?.save(); // 3.登录时，调用 save() 方法
//     print("username: $username, password: $password");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: registerFormKey, // 2.注册标识
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             decoration: InputDecoration(
//               icon: Icon(Icons.person),
//               labelText: "用户名或手机号",
//             ),
//             onSaved: (value) {
//               print("username: $value");
//               this.username = value ?? ""; // 5.保存用户名
//             },
//           ),
//           TextFormField(
//             obscureText: true,
//             decoration: InputDecoration(
//               icon: Icon(Icons.lock),
//               labelText: "密码",
//             ),
//             onSaved: (value) {
//               print("onSaved: $value");
//               this.password = value ?? ""; // 6.保存密码
//             },
//           ),
//           SizedBox(height: 20), // 输入框和按钮的间距
//           Container(
//             // 按钮
//             width: double.infinity,
//             height: 44,
//             child: ElevatedButton(
//               child: Text(
//                 "登 录",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//               onPressed: () {
//                 print("登录");
//                 this.registerForm();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
