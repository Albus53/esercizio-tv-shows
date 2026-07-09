import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:esercizio_tv_shows/widgets/show_card_widget.dart';
import 'package:flutter/material.dart';

class ShowGrid extends StatelessWidget {
  final List<ShowModel> shows;
  final void Function(ShowModel show) onShowTap;

  const ShowGrid({super.key, required this.shows, required this.onShowTap});

  @override
  Widget build(BuildContext context) {
    // Review note:
    // The grid currently has a fixed number of columns.
    // This works on a basic desktop layout, but it is not ideal for Flutter Web,
    // because when the browser window changes size, the cards mainly become
    // bigger or smaller instead of changing the number of cards per row.
    //
    // A possible improvement would be to use LayoutBuilder to manage simple
    // breakpoints. In this way, the app could show fewer cards per row on smaller
    // screens and more cards per row on larger screens, while keeping the card
    // size more consistent.
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
