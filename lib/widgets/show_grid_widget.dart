import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:esercizio_tv_shows/widgets/show_card_widget.dart';
import 'package:flutter/material.dart';

class ShowGrid extends StatelessWidget {
  final List<ShowModel> shows;
  final void Function(ShowModel show) onShowTap;

  const ShowGrid({super.key, required this.shows, required this.onShowTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: shows.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        final show = shows[index];

        return ShowCard(
          show: show,
          onTap: () {
            onShowTap(show);
          },
        );
      },
    );
  }
}
