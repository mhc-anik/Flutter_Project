import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/utility/asset_path.dart';

import '../widgets/screen_backGround.dart';
import 'login_screen.dart';

class spash_screen extends StatefulWidget {
  const spash_screen({super.key});

  @override
  State<spash_screen> createState() => _spash_screenState();
}

class _spash_screenState extends State<spash_screen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => loginScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenBackGround(
        child: Center(
          child: SvgPicture.asset(AssetPath.lklLogoSvg, height: 150),
        ),
      ),
    );
  }
}
