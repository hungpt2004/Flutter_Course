import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
        const Padding(
          padding: EdgeInsets.only(left: 35),
          child: Text("Movie App",textAlign: TextAlign.center,),
        ),
        Container(
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))
            ],
          )
        )
      ],
    );
  }
}
