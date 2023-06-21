import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      //seedColor: const Color.fromARGB(255, 131, 57, 0),
      seedColor: Colors.blue,
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.lato(color: Colors.black, fontSize: 22),
          titleMedium: GoogleFonts.lato(color: Colors.white, fontSize: 16),
          titleSmall: GoogleFonts.lato(color: Colors.white, fontSize: 13),
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.lato(),
        unselectedLabelStyle: GoogleFonts.lato()));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
      darkTheme: ThemeData.dark(),
    );
  }
}
