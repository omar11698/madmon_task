import 'package:flutter/material.dart';
import 'package:madmon_task/main.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -2), // Shadow coming from the bottom
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        elevation: 0,
        title: Text(
          'Reservations',
          style: textTheme.bodyLarge,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25.0),
            child: SvgPicture.asset(
              'assets/icons/not.svg',
            ),
          ),
        ],
        leading: Container(
          margin: const EdgeInsets.only(left: 25.0),
          child: SvgPicture.asset(
            'assets/icons/return.svg',
            height: 13,
            width: 20,
            color: const Color(0xff494949),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
