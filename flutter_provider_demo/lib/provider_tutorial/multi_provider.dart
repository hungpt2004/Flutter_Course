import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( //                                     <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ChangeNotifierProvider<AnotherModel>(create: (context) => AnotherModel()),
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
                      child: Consumer<MyModel>( //            <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return ElevatedButton(
                            child: Text('Do something'),
                            onPressed: (){
                              // We have access to the model.
                              myModel.doSomething();
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>( //              <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),

                ],
              ),

              // SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.red[200],
                      child: Consumer<AnotherModel>( //      <--- AnotherModel Consumer
                        builder: (context, myModel, child) {
                          return ElevatedButton(
                            child: Text('Do something'),
                            onPressed: (){
                              myModel.doSomething();
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.yellow[200],
                    child: Consumer<AnotherModel>( //        <--- AnotherModel Consumer
                      builder: (context, anotherModel, child) {
                        return Text('${anotherModel.someValue}');
                      },
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class MyModel with ChangeNotifier { //                        <--- MyModel
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel with ChangeNotifier { //                   <--- AnotherModel
  int someValue = 0;
  void doSomething() {
    someValue = 5;
    print(someValue);
    notifyListeners();
  }
}
