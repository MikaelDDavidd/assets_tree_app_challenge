import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TractianIcon extends StatelessWidget {
  final double width;
  const TractianIcon({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/tractian_icon.svg',
      width: width * 0.4,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }
}
