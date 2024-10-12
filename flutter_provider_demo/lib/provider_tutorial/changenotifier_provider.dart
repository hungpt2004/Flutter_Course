import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(0);
    return ChangeNotifierProvider<MyModel>( //      <--- ChangeNotifierProvider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                  <--- Consumer
                    builder: (context, myModel, child) {
                      print(1);
                      final myModel = Provider.of<MyModel>(context, listen: false);
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
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    print(2);
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier { //                          <--- MyModel
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}
