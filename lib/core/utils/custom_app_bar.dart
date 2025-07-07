import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gurudwara/core/constants/dimensions.dart';

class AppBarController extends GetxController {
  var currentIcon = Icons.arrow_back.obs;

  void toggleIcon(IconData initialIcon, IconData? changedIcon) {
    if (changedIcon != null) {
      currentIcon.value =
          currentIcon.value == initialIcon ? changedIcon : initialIcon;
    }
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final IconData initialIcon;
  final IconData? changedIcon;
  final VoidCallback? onBack;
  final bool centerTitle; // NEW PARAMETER

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.initialIcon = Icons.arrow_back,
    this.changedIcon,
    this.onBack,
    this.centerTitle = true, // DEFAULT TO TRUE
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppBarController());
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:Colors.transparent,
      elevation: 2,
      centerTitle: centerTitle,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Dimensions.radius30), // Adjust radius as needed
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.headlineLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.font20,
        ),
      ),
      leading: showBackButton
          ? Obx(
            () => IconButton(
          icon: Icon(
            controller.currentIcon.value,
            color: colorScheme.primary,
          ),
          onPressed: () {
            controller.toggleIcon(initialIcon, changedIcon);
            if (onBack != null) {
              onBack!();
            } else {
              Get.back();
            }
          },
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
