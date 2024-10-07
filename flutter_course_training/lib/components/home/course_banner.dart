import 'package:flutter/material.dart';

class MyCourseBanner extends StatelessWidget {
  const MyCourseBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First row with icons and text
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconWithLabel(
                icon: Icons.category,
                label: 'Category',
                color: Colors.amber,
              ),
              buildIconWithLabel(
                icon: Icons.not_started,
                label: 'Start',
                color: const Color(0xFF70DE91),
              ),
              buildIconWithLabel(
                icon: Icons.content_paste,
                label: 'Content',
                color: Colors.blue[300],
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Second row with icons and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconWithLabel(
                icon: Icons.store,
                label: 'Store',
                color: Colors.red[300],
              ),
              buildIconWithLabel(
                icon: Icons.play_circle_fill_outlined,
                label: 'Play',
                color: Color(0xFF70DE91),
              ),
              buildIconWithLabel(
                icon: Icons.leaderboard,
                label: 'Leaderboard',
                color: Colors.blue[300],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build the icon and label widget
  Widget buildIconWithLabel({
    required IconData icon,
    required String label,
    required Color? color,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            onPressed: () {},
            icon: Icon(icon, color: Colors.white, size: 35),
            style: TextButton.styleFrom(backgroundColor: color),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ],
    );
  }
}
