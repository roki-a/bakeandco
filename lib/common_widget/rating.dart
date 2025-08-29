import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double initialRating;
  final void Function(double)? onRatingChanged;

  const StarRating({super.key, this.initialRating = 0, this.onRatingChanged});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        int starIndex = index + 1;
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = starIndex.toDouble();
            });
            widget.onRatingChanged?.call(_rating);
          },
          child: Icon(
            _rating >= starIndex ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 16,
          ),
        );
      }),
    );
  }
}
