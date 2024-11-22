import 'package:flutter/material.dart';

Widget drawerItem(
    {required String leadingImageAsset,
    required String text,
    required Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: ListTile(
      tileColor: Colors.white,
      leading: Image.asset(leadingImageAsset, height: 24),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Image.asset(
        'assets/images/arrow_next_small.png',
        height: 24,
      ),
      onTap: onTap,
    ),
  );
}
