import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/asset_path.dart';

class screenBackGround extends StatelessWidget {
  const screenBackGround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetPath.backGroundSvg,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        SafeArea(child: child),
      ],
    );
  }
}
