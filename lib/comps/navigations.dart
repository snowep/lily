import 'package:flutter/material.dart';
import 'package:lily/models/destination.dart';

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
          return BuildPC(context);
        } else if (constraints.maxWidth >= 600 &&
            constraints.maxWidth <= 1200) {
          // For medium screens (Tablet), use a collapsible drawer
          return BuildTablet(context);
        } else {
          // For small screens (Mobile), use a bottom navigation bar
          return buildMobile(context);
        }
      },
    );
  }

  Widget buildMobile(BuildContext context) {
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

  Widget BuildTablet(BuildContext context) {
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

  Widget BuildPC(BuildContext context) {
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
              ...destinationsAdm.map((Destination destinationsAdm) {
                return NavigationDrawerDestination(
                  label: Text(destinationsAdm.label),
                  icon: destinationsAdm.icon,
                  selectedIcon: destinationsAdm.selectedIcon,
                );
              }),
            ],
          ),
          Expanded(
            child: destinationsAdm[screenIndex].screen,
          ),
        ],
      ),
    );
  }
}
