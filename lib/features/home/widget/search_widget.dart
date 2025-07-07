import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';

class SearchWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height5),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,  // Theme-based background
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(
          color: colorScheme.onSecondaryContainer,  // Text color from theme
        ),
        decoration: InputDecoration(
          filled: false,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Gurudwaras...',
          hintStyle: TextStyle(
            color: colorScheme.onSecondaryContainer.withOpacity(0.7),  // Theme-based hint color
            fontSize: Dimensions.font16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.onSecondaryContainer,  // Icon color from theme
          ),
        ),
      ),
    );
  }
}
