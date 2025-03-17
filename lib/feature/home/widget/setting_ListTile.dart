// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/resources/app_color.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    this.ontap,
    this.leadingIcon,
    // this.trailingIcon,
    required this.text,
  });
  final VoidCallback? ontap;
  final IconData? leadingIcon;
  // final IconData? trailingIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        leadingIcon,
        color: AppColor.primary,
        size: 25,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        color: AppColor.blodbrownText,
        size: 16,
      ),
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: AppColor.brown),
      ),
    );
  }
}
