import 'package:flutter/material.dart';
import 'package:lily/screens/bookshelf.dart';
import 'package:lily/screens/dashboard/page.dart';
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
    'Home',
    Icon(Icons.home_outlined),
    Icon(Icons.home_filled),
    HomeScreen(),
  ),
  const Destination(
    'Activity',
    Icon(Icons.notifications_none),
    Icon(Icons.notifications),
    HomeScreen(),
  ),
  Destination(
    'Bookshelf',
    const Icon(Icons.shelves),
    const Icon(Icons.shelves),
    Bookshelf(),
  ),
];

List<Destination> destinationsAdm = <Destination>[
  Destination(
    'Dashboard',
    Icon(Icons.dashboard_outlined),
    Icon(Icons.dashboard),
    DashboardPage(),
  )
];
