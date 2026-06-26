import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:flutter/material.dart';

class ShowCard extends StatelessWidget {
  final ShowModel show;
  final VoidCallback onTap;

  const ShowCard({super.key, required this.show, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final rating = show.rating.average?.toString() ?? 'N/A';

    return Card(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                show.image.medium,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          show.premiered,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const Icon(Icons.star, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    show.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
