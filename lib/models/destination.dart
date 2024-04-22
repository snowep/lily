import 'package:flutter/material.dart';
import 'package:lily/screens/bookshelf.dart';
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
  const Destination(
      'Bookshelf', Icon(Icons.shelves), Icon(Icons.shelves), BookShelf()),
];
