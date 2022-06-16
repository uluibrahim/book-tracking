import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/image/image_constants.dart';
import '../home/view/home_view.dart';
import '../home/viewmodel/home_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int bookCount = 30;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      Route route = MaterialPageRoute(builder: (_) {
        return ChangeNotifierProvider(
          create: (_) => HomeViewmodel(bookCount),
          child: HomeView(),
        );
      });
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          ImageConstants.instance.toJpeg("img_reading_books"),
        ),
      ),
    );
  }
}
