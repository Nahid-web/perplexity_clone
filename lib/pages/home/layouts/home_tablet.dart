import 'package:flutter/material.dart';
import 'package:perplexity_clone/themes/colors.dart';
import 'package:perplexity_clone/utils/responsive_spacing.dart';

class HomeTabletLayout extends StatelessWidget {
  const HomeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = ResponsiveSpacing.getPadding(width);

    return Scaffold(
      body: Row(
        children: [
          // Navigation Rail
          NavigationRail(
            extended: width >= 800,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.history),
                label: Text('History'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (index) {
              // TODO: Implement navigation
            },
          ),
          // Main Content
          Expanded(
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchBar(
                          hintText: 'Ask anything...',
                          leading: const Icon(Icons.search),
                          trailing: const [Icon(Icons.mic)],
                        ),
                      ),
                      const SizedBox(width: 16),
                      const CircleAvatar(child: Icon(Icons.person)),
                    ],
                  ),
                ),
                // Main Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ask me anything',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Get instant answers from multiple sources',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 48),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Type your question...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.mic),
                                  onPressed: () {
                                    // TODO: Implement voice input
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
