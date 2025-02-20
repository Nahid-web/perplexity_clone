import 'package:flutter/material.dart';
import 'package:perplexity_clone/pages/home/layouts/home_desktop.dart';
import 'package:perplexity_clone/pages/home/layouts/home_mobile.dart';
import 'package:perplexity_clone/pages/home/layouts/home_tablet.dart';
import 'package:perplexity_clone/utils/breakpoints.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Breakpoints.isDesktop(constraints.maxWidth)) {
          return const HomeDesktopLayout();
        }
        if (Breakpoints.isTablet(constraints.maxWidth)) {
          return const HomeTabletLayout();
        }
        return const HomeMobileLayout();
      },
    );
  }
}
