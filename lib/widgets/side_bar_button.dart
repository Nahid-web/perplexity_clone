import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SideBarButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;

  const SideBarButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 22),
        ),
        isCollapsed
            ? const SizedBox()
            : Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
      ],
    );
  }
}
