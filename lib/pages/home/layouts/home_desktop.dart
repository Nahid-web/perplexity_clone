import 'package:flutter/material.dart';
import 'package:perplexity_clone/themes/colors.dart';
import 'package:perplexity_clone/utils/responsive_spacing.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = ResponsiveSpacing.getPadding(width);

    return Scaffold(
      body: Row(
        children: [
          // Left Navigation Panel
          NavigationRail(
            extended: true,
            minExtendedWidth: 220,
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

          // Main Content Area
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Top App Bar
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchBar(
                          hintText: 'Ask anything...',
                          leading: const Icon(Icons.search),
                          trailing: const [
                            Icon(Icons.mic),
                            SizedBox(width: 8),
                            Icon(Icons.tune),
                          ],
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
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ask me anything',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Get instant answers from multiple sources\nPowered by advanced AI technology',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 48),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type your question...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.mic),
                                        onPressed: () {
                                          // TODO: Implement voice input
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.tune),
                                        onPressed: () {
                                          // TODO: Implement search options
                                        },
                                      ),
                                    ],
                                  ),
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

          // Right Panel (Resources, History, etc.)
          SizedBox(
            width: 300,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: const Row(
                      children: [
                        Icon(Icons.article_outlined),
                        SizedBox(width: 12),
                        Text(
                          'Recent Sources',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 0,
                      padding: EdgeInsets.all(padding),
                      itemBuilder: (context, index) {
                        return const SizedBox.shrink(); // Placeholder
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
