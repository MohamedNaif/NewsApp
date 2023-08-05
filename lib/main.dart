import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/splash_screen.dart';

import 'api/firebase_api.dart';
import 'data/cubits/home_screen_cubit/news_app_cubit.dart';
import 'data/cubits/them/them_cubit.dart';

final lightTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 255, 255, 255),
    cardColor: Colors.black,
    hintColor: Colors.grey

    // Add other light mode theme properties and colors here
    );

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  cardColor: Colors.white,
  hintColor: Color.fromARGB(255, 234, 99, 105), // Example color for dark mode
  // Add other dark mode theme properties and colors here
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await FirebaseApi().getFCMToken();
  print('Handling a background message: ${message.messageId}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseApi().getFCMToken();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsAppCubit>(
          create: (BuildContext context) => NewsAppCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: isDarkMode ? darkTheme : lightTheme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
