import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCategory extends StatefulWidget {
  const ButtonCategory({super.key});

  @override
  State<ButtonCategory> createState() => _ButtonCategoryState();
}

class _ButtonCategoryState extends State<ButtonCategory> {

  final List<String> category = ["Science", "Sports", "Business", "Family", "Education"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Tăng chiều cao để chứa dấu chấm
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          final type = category[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blue, width: 2)
                      )
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      type,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onPressed: () {}
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
