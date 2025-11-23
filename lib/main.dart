import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/splashlogin.dart';
import 'package:flutter_application_15cubit/counter/countercubit.dart';
import 'package:flutter_application_15cubit/newsapp/articlecubit.dart';
import 'package:flutter_application_15cubit/newsapp/newscubit.dart';
import 'package:flutter_application_15cubit/newsapp/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Countercubit()),
        BlocProvider(create: (context) => Newscubit()),
        BlocProvider(create: (context) => ArticleCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash_login());
  }
}
