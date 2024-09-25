import 'package:flutter/material.dart';
import 'package:travel_app_ui/constant/constant_value.dart';

class MyCategoryButtonSecond extends StatefulWidget {
  const MyCategoryButtonSecond({super.key});

  @override
  State<MyCategoryButtonSecond> createState() => _MyCategoryButtonSecondState();
}

class _MyCategoryButtonSecondState extends State<MyCategoryButtonSecond> {
  // Cập nhật danh sách categories để chứa URL ảnh và màu nền khác nhau
  static final List<Map<String, dynamic>> categories = [
    {'imageUrl': 'assets/images/beatch.png', 'label': 'Beach', 'color': Colors.pink[100]},
    {'imageUrl': 'assets/images/camping.png', 'label': 'Camping', 'color': Colors.blue[100]},
    {'imageUrl': 'assets/images/car.png', 'label': 'Car', 'color': Colors.purple[100]},
    {'imageUrl': 'assets/images/food.png', 'label': 'Food', 'color': Colors.red[200]},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories.map((category) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  // Xử lý khi người dùng nhấp vào
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: category['color'], // Sử dụng màu từ danh sách
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.asset(
                        category['imageUrl'],
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8), // Thêm khoảng cách giữa ảnh và nhãn
            Text(
              category['label'],
              style: const TextStyle(
                color: Colors.black,
                fontFamily: textFamily,
                fontSize: 16
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
