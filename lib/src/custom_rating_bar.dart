import 'package:flutter/material.dart';

class CustomRatingBar extends StatefulWidget {
  final int numberStars;
  final double value;

  const CustomRatingBar({this.numberStars = 5, this.value = 1.0, super.key});

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  bool flagDecimal = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: dynamicIcons());
  }

  List<Widget> dynamicIcons() {
    int count = 1;
    bool flagDecimal = false;

    var numStarString = widget.value.toString();
    var arrNum = numStarString.split('.');

    return List<Widget>.generate(widget.numberStars, (int index) {
      if (count <= int.parse(arrNum[0])) {
        count += 1;
        return RatingIcon(icon: Icons.star);
      } else if (int.parse(arrNum[1]) != 0 && flagDecimal == false) {
        count += 1;
        flagDecimal = true;
        return RatingIcon(icon: Icons.star_half);
      } else if (count > int.parse(arrNum[0])) {
        count += 1;
        return RatingIcon(icon: Icons.star_border);
      }

      return Container();
    });
  }

  RatingIcon _buildIcon(int idx) {
    final valueString = widget.value.toString();
    final values = valueString.split('.');

    if (idx + 1 <= int.parse(values[0])) {
      return const RatingIcon(icon: Icons.star);
    } else if (int.parse(values[1]) != 0 && flagDecimal == false) {
      flagDecimal = true;
      setState(() {});
      return const RatingIcon(icon: Icons.star_half);
    } else if (idx + 1 > int.parse(values[0])) {
      return const RatingIcon(icon: Icons.star_border_outlined);
    }
    return RatingIcon(icon: Icons.star);
  }
}

class RatingIcon extends StatelessWidget {
  final IconData icon;
  const RatingIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 45,
      color: Colors.red,
    );
  }
}
