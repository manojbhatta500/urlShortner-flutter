import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortner/bloc/generate_url_bloc.dart';
import 'package:urlshortner/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateUrlBloc(),
      child: MaterialApp(
        title: 'URL Shortener',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
