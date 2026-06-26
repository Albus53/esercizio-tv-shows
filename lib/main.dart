import 'package:esercizio_tv_shows/providers/show_provider.dart';
import 'package:esercizio_tv_shows/screens/show_list_screen.dart';
import 'package:esercizio_tv_shows/services/show_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShowsProvider(ShowApiService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Esercizio Tv Shows',
      home: ShowListScreen(),
    );
  }
}
