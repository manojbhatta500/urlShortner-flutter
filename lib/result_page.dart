import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key, required this.id}) : super(key: key);

  final String id;
  final String userUrl = 'http://localhost:8000';

  @override
  Widget build(BuildContext context) {
    log('user url  result page: ${userUrl}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shortened URL'),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Text(
              'Shortened URL:',
              style: TextStyle(color: Colors.teal, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            SelectableText(
              '${userUrl}/${id}',
              style: const TextStyle(fontSize: 16.0),
              onTap: () async {
                final url = '${userUrl}/${id}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')));
                }
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 100,
            ),
            TextButton.icon(
              onPressed: () async {
                final url = '${userUrl}/${id}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')));
                }
              },
              icon: const Icon(Icons.arrow_forward),
              label: Text('${userUrl}/${id}'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
