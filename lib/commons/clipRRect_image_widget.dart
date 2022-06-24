// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClipRRectWidget {
  clipRRect(String imageUrl) {
    return ClipRRect(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
