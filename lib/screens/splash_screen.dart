import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cubits/home_screen_cubit/news_app_cubit.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      context.read<NewsAppCubit>().getNewsApp();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => HomePag()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFdd1818),
              Color(0xFF333333),
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset('assets/pngwing.com.png'),
            ),
            const Text(
              'News App',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'New York Small',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                height: 1.15556,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
