import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/constant/constant_value.dart';

class MyCategoryButton extends StatefulWidget {
  const MyCategoryButton({super.key, required this.onCategorySelected});

  final ValueChanged<String> onCategorySelected;

  @override
  State<MyCategoryButton> createState() => _MyCategoryButtonState();
}

class _MyCategoryButtonState extends State<MyCategoryButton> {
  static final List<String> rankingType = ["Best nature", "Most viewed", "Recommend", "All"];
  static final List<String> categories = ["Beach","Camping","Car","Food"];
  String selectedType = "Best nature";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // Tăng chiều cao để chứa dấu chấm
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rankingType.length,
        itemBuilder: (context, index) {
          final type = rankingType[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(right: 12, left: 10)),
                    backgroundColor: MaterialStateProperty.all(
                      selectedType == type ? Colors.white : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(fontSize: 20, color: primaryColor, fontFamily: textFamily),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedType = type;
                    });
                    widget.onCategorySelected(type);
                  },
                ),
                // Dấu chấm bên dưới văn bản
                Container(
                  height: 8.0, // Chiều cao của dấu chấm
                  width: 8.0, // Chiều rộng của dấu chấm
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedType == type ? primaryColor : Colors.transparent, // Màu sắc của dấu chấm
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
