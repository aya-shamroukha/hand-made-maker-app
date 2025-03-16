import 'package:flutter/material.dart';

import '../../core/resources/app_color.dart';

class CustomTextfield extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomTextfield({
    super.key,
    this.validate,
    required this.labeltext,
    this.controller,
    this.suffixicon,
    this.isScreat = false,
    this.prefixIcon,
    this.textInputType,
    this.onchanged,
  });

  final String labeltext;
  final TextEditingController? controller;
  final dynamic validate;
  final dynamic onchanged;
  final IconButton? suffixicon;
  final Icon? prefixIcon;
  final bool isScreat;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
        child: TextFormField(
          //  key: BlocProvider.of<LogInBloc>(context).formkey,
          style: Theme.of(context).textTheme.displaySmall!,
          keyboardType: textInputType,
          validator: validate,
          obscureText: isScreat,
          onChanged: onchanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: labeltext,
              prefixIcon: prefixIcon,
              suffixIcon: suffixicon),
        ),
      );
    });
  }
}
