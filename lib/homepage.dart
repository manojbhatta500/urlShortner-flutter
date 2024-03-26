import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortner/bloc/generate_url_bloc.dart';
import 'package:urlshortner/result_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Shortener'),
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        color: Colors.black12.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  hintText: 'Enter a long URL',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20.0),
              BlocListener<GenerateUrlBloc, GenerateUrlState>(
                listener: (context, state) {
                  switch (state.runtimeType) {
                    case GenerateUrlSuccess:
                      final data = state as GenerateUrlSuccess;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Url genereated')));

                      log('user url success: ${_urlController.text}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultPage(id: data.successdata.id!)));

                    case GenerateUrlFailed:
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('something is wrong')));

                    default:
                      log('this is wrong');
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    log('user url (initial): ${_urlController.text}'); // Log initial state

                    BlocProvider.of<GenerateUrlBloc>(context)
                        .add(onButtonPressed(url: _urlController.text));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.shade200,
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Shorten URL',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
