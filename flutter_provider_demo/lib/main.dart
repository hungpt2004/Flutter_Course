import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Giả lập một hàm tải dữ liệu bất đồng bộ
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Hello from the Future!';
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        FutureProvider<String>(
          create: (context) => fetchData(),
          initialData: 'Loading...',  // Dữ liệu ban đầu khi đang chờ Future hoàn thành
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureProvider Example'),
        ),
        body: Center(
          child: Consumer<String>(
            builder: (context, data, child) {
              return Text(data);  // Hiển thị dữ liệu từ FutureProvider
            },
          ),
        ),
      ),
    );
  }
}
