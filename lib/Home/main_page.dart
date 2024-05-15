import 'package:flutter/material.dart';

import '../Questionnaire/artist_questionnaire.dart';

class MainPage extends StatefulWidget {
  final String? documentId;
  final String userType;

  const MainPage({super.key, required this.documentId, required this.userType});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print('got doc id is ${widget.documentId}');
    if (widget.documentId == null || widget.documentId!.isEmpty) {
      return const ArtistQuestionnaire();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to the Main Page!',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Action to navigate to another page
                  // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherPage()));
                },
                child: const Text('Go to Another Page'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
