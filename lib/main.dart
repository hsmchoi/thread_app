import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/tweeter/features/navbar/main_navbar_tweet.dart';
import 'package:tiktok_clone/tweeter/features/settings/repos/darkmode_config_repo.dart';
import 'package:tiktok_clone/tweeter/features/settings/view_models/darkmode_config_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkmodeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkModeConfigProvider.overrideWith(
          () => DarkmodeConfigViewModel(
            repository,
          ),
        ),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends ConsumerWidget {
  const Myapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thread',
      themeMode: ref.watch(darkModeConfigProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.nanumGothic(
            fontSize: 94,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          displayMedium: GoogleFonts.nanumGothic(
            fontSize: 59,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          displaySmall: GoogleFonts.nanumGothic(
            fontSize: 47,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: GoogleFonts.nanumGothic(
            fontSize: 33,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
          headlineSmall: GoogleFonts.nanumGothic(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: GoogleFonts.nanumGothic(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.15,
          ),
          titleMedium: GoogleFonts.nanumGothic(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          titleSmall: GoogleFonts.nanumGothic(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyLarge: GoogleFonts.nanumGothic(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.nanumGothic(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
          labelLarge: GoogleFonts.nanumGothic(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          bodySmall: GoogleFonts.nanumGothic(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelSmall: GoogleFonts.nanumGothic(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.black),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        primaryColor: const Color(0xff4E98E9),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4E98E9),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.black,
          dividerColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xff4E98E9),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4E98E9),
        ),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.nanumGothic(
            fontSize: 94,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          displayMedium: GoogleFonts.nanumGothic(
            fontSize: 59,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          displaySmall: GoogleFonts.nanumGothic(
            fontSize: 47,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: GoogleFonts.nanumGothic(
            fontSize: 33,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
          headlineSmall: GoogleFonts.nanumGothic(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: GoogleFonts.nanumGothic(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.15,
          ),
          titleMedium: GoogleFonts.nanumGothic(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          titleSmall: GoogleFonts.nanumGothic(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyLarge: GoogleFonts.nanumGothic(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.nanumGothic(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
          labelLarge: GoogleFonts.nanumGothic(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          bodySmall: GoogleFonts.nanumGothic(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelSmall: GoogleFonts.nanumGothic(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.grey.shade700,
          dividerColor: Colors.black,
        ),
      ),
      home: const MainNavbarTweetScreen(),
    );
  }
}
