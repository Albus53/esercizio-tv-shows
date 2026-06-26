import 'package:esercizio_tv_shows/providers/show_provider.dart';
import 'package:esercizio_tv_shows/screens/show_detail_screen.dart';
import 'package:esercizio_tv_shows/widgets/show_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowListScreen extends StatefulWidget {
  const ShowListScreen({super.key});

  @override
  State<ShowListScreen> createState() => _ShowListScreenState();
}

class _ShowListScreenState extends State<ShowListScreen> {
  @override
  void initState() {
    super.initState();

    final showsProvider = context.read<ShowsProvider>();

    Future.microtask(() {
      showsProvider.getShows();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShowsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () {
                    context.read<ShowsProvider>().getShows();
                  },
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh shows',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Builder(
          builder: (context) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage != null) {
              return Center(child: Text(provider.errorMessage!));
            }

            if (provider.shows.isEmpty) {
              return const Center(child: Text('No shows found'));
            }

            return ShowGrid(
              shows: provider.shows,
              onShowTap: (show) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowDetailScreen(show: show),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
