import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( //                              <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel>( //               <--- ChangeNotifierProvider
          create: (context) => MyModel(),
        ),
        ProxyProvider<MyModel, AnotherModel>( //          <--- ProxyProvider
          update: (context, myModel, anotherModel) => AnotherModel(myModel),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<MyModel>( //          <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return ElevatedButton(
                            child: Text('Do something'),
                            onPressed: (){
                              myModel.doSomething('Goodbye');
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>( //            <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),

                ],
              ),

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  child: Consumer<AnotherModel>( //          <--- AnotherModel Consumer
                    builder: (context, anotherModel, child) {
                      return ElevatedButton(
                        child: Text('Do something else'),
                        onPressed: (){
                          anotherModel.doSomethingElse();
                        },
                      );
                    },
                  )
              ),

            ],
          ),
        ),
      ),
    );

  }
}

class MyModel with ChangeNotifier { //                       <--- MyModel
  String someValue = 'Hello';
  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel { //                                      <--- AnotherModel
  MyModel _myModel;
  AnotherModel(this._myModel);
  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}
