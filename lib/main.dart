import 'dart:collection';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'catalog/widget.dart';
import 'myapp/widget.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => const FirstScreen(),
      '/myapp': (context) => const MyApp(),
      '/todo': (context) => const Todo(),
      '/catalog': (context) => const MyCatalog(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
        ),
        body: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/myapp');
              },
              child: const Text('MyApp'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/todo');
                },
                child: const Text('Todo')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/catalog');
                },
                child: const Text('Catalog')),
          ],
        ));
  }
}

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
