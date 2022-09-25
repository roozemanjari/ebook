import 'package:ebook/utils/constants.dart';
import 'package:flutter/material.dart';

showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 500.0,
      child: Column(
        children: [
          const Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 24.0,
              color: primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
