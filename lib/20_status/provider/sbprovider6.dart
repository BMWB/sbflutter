/*
 * @Author: wangtianji
 * @Date: 2021-07-31 16:17:30
 * @LastEditTime: 2021-07-31 16:18:07
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/provider/sbprovider6.dart
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(
      //                              <--- Provider
      create: (context) => MyModel(),
      child:
          Consumer<MyModel>(//                           <--- MyModel Consumer
              builder: (context, myModel, child) {
        return ValueListenableProvider<String>.value(
          // <--- ValueListenableProvider
          value: myModel.someValue,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: Text('My App')),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<MyModel>(
                        //       <--- Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              myModel.doSomething();
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<String>(
                      //           <--- String Consumer
                      builder: (context, myValue, child) {
                        return Text(myValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class MyModel {
  //                                             <--- MyModel
  ValueNotifier<String> someValue =
      ValueNotifier('Hello'); // <--- ValueNotifier
  void doSomething() {
    someValue.value = 'Goodbye';
    print(someValue.value);
  }
}
