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
      // Review note:
      // The UI is currently very simple because I focused mainly on the functional
      // requirements of the exercise, such as API calls, state management, loading
      // and error states, navigation and refresh.
      //
      // A possible improvement would be to add a dedicated theme file to centralize
      // colors, text styles, card shapes and other common UI styles. This would make
      // the app more consistent and easier to update without changing each widget
      // individually.
      debugShowCheckedModeBanner: false,
      title: 'Esercizio Tv Shows',
      home: ShowListScreen(),
    );
  }
}
