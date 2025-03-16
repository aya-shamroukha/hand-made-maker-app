// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class SizedBox_Height extends StatelessWidget {
  const SizedBox_Height({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SizedBox_width extends StatelessWidget {
  const SizedBox_width({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
