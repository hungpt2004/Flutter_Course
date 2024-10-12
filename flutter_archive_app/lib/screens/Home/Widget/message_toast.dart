import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  void showMessageDialog(BuildContext context, String message, bool status) {
    Flushbar(
      messageText: Row(
        children: [
          Icon(
            status ? Icons.check : Icons.clear,
            color: status ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            message,
            style: const TextStyle(
              fontSize: 15, // Kích thước font chữ
              fontWeight: FontWeight.w600, // Kiểu chữ đậm
              color: Colors.black, // Màu chữ
            ),
          ),
        ],
      ),
      boxShadows: [
        BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3)),
      ],
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white, // Màu nền của Toast
      margin: EdgeInsets.all(8), // Lề của Toast
      borderRadius: BorderRadius.circular(8), // Bo góc cho Toast
    ).show(context);
  }
