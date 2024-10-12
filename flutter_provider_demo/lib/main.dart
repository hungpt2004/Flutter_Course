// // import 'package:flutter/material.dart';
// // import 'package:flutter_provider_demo/providers/providers.dart';
// // import 'package:flutter_provider_demo/screens/product_detail_screen.dart';
// // import 'package:flutter_provider_demo/screens/products_overview_screen.dart';
// // import 'package:provider/provider.dart';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (ctx) => Products(),
// //       child: MaterialApp(
// //         title: 'MyShop',
// //         theme: ThemeData(
// //           colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
// //               .copyWith(secondary: Colors.deepOrange),
// //           fontFamily: 'Lato',
// //         ),
// //         home: ProductsOverviewScreen(),
// //         routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()},
// //       ),
// //     );
// //   }
// // }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter_provider_demo/provider_tutorial/my_model.dart';
// // import 'package:provider/provider.dart';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider<MyModel>( //                                <--- Provider
// //       create: (context) => MyModel(),
// //       child: MaterialApp(
// //         home: Scaffold(
// //           appBar: AppBar(title: Text('My App')),
// //           body: Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //
// //               Container(
// //                   padding: const EdgeInsets.all(20),
// //                   color: Colors.green[200],
// //                   child: Consumer<MyModel>( //                    <--- Consumer
// //                     builder: (context, myModel, child) {
// //                       return TextButton(
// //                         child: Text('Do something'),
// //                         onPressed: (){
// //                           // We have access to the model.
// //                           myModel.doSomething();
// //                         },
// //                       );
// //                     },
// //                   )
// //               ),
// //
// //               Container(
// //                 padding: const EdgeInsets.all(35),
// //                 color: Colors.blue[200],
// //                 child: Consumer<MyModel>( //                    <--- Consumer
// //                   builder: (context, myModel, child) {
// //                     return Text(myModel.someValue);
// //                   },
// //                 ),
// //               ),
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_provider_demo/provider_tutorial/lib/data/repository/product_repository_impl.dart';
// import 'package:flutter_provider_demo/provider_tutorial/lib/data/sources/product_local_data_source.dart';
// import 'package:flutter_provider_demo/provider_tutorial/lib/domain/usecases/get_product_use_case.dart';
// import 'package:flutter_provider_demo/provider_tutorial/lib/presentation/providers/product_provider.dart';
// import 'package:flutter_provider_demo/provider_tutorial/lib/presentation/screens/product_screen.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(APP());
// }
//
// class APP extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => ProductProvider(getProductsUseCase: GetProductsUseCase(ProductRepositoryImpl(ProductLocalDataSource()),),),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Flutter Clean Architecture',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: ProductScreen(),
//       ),
//     );
//   }
// }