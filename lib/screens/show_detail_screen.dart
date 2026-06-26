import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:flutter/material.dart';

class ShowDetailScreen extends StatelessWidget {
  final ShowModel show;

  const ShowDetailScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    final rating = show.rating.average?.toString() ?? 'N/A';
    final ended = show.ended ?? 'N/A';
    final network = show.network?.name ?? 'N/A';
    final officialSite = show.officialSite ?? 'N/A';
    final genres = show.genres.join(', ');

    return Scaffold(
      appBar: AppBar(title: Text(show.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(show.name, style: Theme.of(context).textTheme.headlineMedium),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 260,
                  child: Image.network(show.image.original, fit: BoxFit.cover),
                ),

                const SizedBox(width: 24),

                Expanded(
                  child: Text(
                    show.cleanSummary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text('Genres: $genres'),
            const SizedBox(height: 8),

            Text('Rating: $rating'),
            const SizedBox(height: 8),

            Text('Premiered: ${show.premiered}'),
            const SizedBox(height: 8),

            Text('Ended: $ended'),
            const SizedBox(height: 8),

            Text('Status: ${show.status}'),
            const SizedBox(height: 8),

            Text('Language: ${show.language}'),
            const SizedBox(height: 8),

            Text('Network: $network'),
            const SizedBox(height: 8),

            Text('Official site: $officialSite'),
          ],
        ),
      ),
    );
  }
}
