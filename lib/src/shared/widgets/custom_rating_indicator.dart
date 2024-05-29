import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingIndicator extends StatelessWidget {
  const CustomRatingIndicator(
      {super.key, required this.rating, required this.size});
  final num rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating.toDouble(),
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: size,
    );
  }
}
