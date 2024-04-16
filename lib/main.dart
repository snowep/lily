import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:lily/comps/navigations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 197, 161, 175),
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 197, 161, 175),
            brightness: Brightness.dark,
          );
        }

        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
          ),
          home: const Navigations(),
        );
      },
    );
  }
}
