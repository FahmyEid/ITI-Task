import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task6/cubit/post_cubit/post_cubit.dart';
import 'package:task6/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.red,
            titleTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: PostPage(),
      ),
    );
  }
}
