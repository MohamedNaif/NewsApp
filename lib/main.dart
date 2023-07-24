import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/splash_screen.dart';

import 'data/cubits/home_screen_cubit/news_app_cubit.dart';
import 'data/cubits/news_screen_cubit/news_screen_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsAppCubit>(
          create: (BuildContext context) => NewsAppCubit(),
        ),
        BlocProvider<NewsScreenCubitCubit>(
          create: (BuildContext context) => NewsScreenCubitCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
          primaryColor: Color(0xffFF3A44),
        ),
      ),
    );
  }
}
