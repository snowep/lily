import 'package:flutter/material.dart';
import 'package:lily/screens/home.dart';

class Destination {
  const Destination(this.label, this.icon, this.selectedIcon, this.screen);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget screen;
}

List<Destination> destinations = <Destination>[
  const Destination(
      'Home', Icon(Icons.home_outlined), Icon(Icons.home_filled), HomeScreen()),
  const Destination(
      'News', Icon(Icons.article_outlined), Icon(Icons.article), HomeScreen()),
  const Destination('Settings', Icon(Icons.settings_outlined),
      Icon(Icons.settings), HomeScreen()),
];

class Navigations extends StatefulWidget {
  const Navigations({super.key});

  @override
  NavigationsState createState() => NavigationsState();
}

class NavigationsState extends State<Navigations> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          // For large screens (PC), keep the drawer open
          return buildNavigationDrawer(context);
        } else if (constraints.maxWidth >= 600 &&
            constraints.maxWidth <= 1200) {
          // For medium screens (Tablet), use a collapsible drawer
          return buildNavigationRail(context);
        } else {
          // For small screens (Mobile), use a bottom navigation bar
          return buildNavigationBar(context);
        }
      },
    );
  }

  Widget buildNavigationBar(BuildContext context) {
    return Scaffold(
      body: Container(
        child: destinations[screenIndex].screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        onTap: handleScreenChanged,
        items: destinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: destination.icon,
            label: destination.label,
          );
        }).toList(),
      ),
    );
  }

  Widget buildNavigationRail(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  NavigationRail(
                    selectedIndex: screenIndex,
                    onDestinationSelected: handleScreenChanged,
                    labelType: NavigationRailLabelType.all,
                    destinations: destinations.map((Destination destination) {
                      return NavigationRailDestination(
                        icon: destination.icon,
                        selectedIcon: destination.selectedIcon,
                        label: Text(destination.label),
                      );
                    }).toList(),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: destinations[screenIndex].screen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationDrawer(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationDrawer(
            selectedIndex: screenIndex,
            onDestinationSelected: handleScreenChanged,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              ),
              ...destinations.map((Destination destination) {
                return NavigationDrawerDestination(
                  label: Text(destination.label),
                  icon: destination.icon,
                  selectedIcon: destination.selectedIcon,
                );
              }),
            ],
          ),
          Expanded(
            child: destinations[screenIndex].screen,
          ),
        ],
      ),
    );
  }
}
