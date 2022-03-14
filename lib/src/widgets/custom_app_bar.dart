import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/utils/theme_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: Get.back<dynamic>,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(title),
      centerTitle: true,
      backgroundColor: ThemeUtils.green,
    );
  }
}
