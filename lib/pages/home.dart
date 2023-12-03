import 'package:bigbadapp/data/repositories/api_article_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/customListTile.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title, required this.onButtonPressed});

  final String title;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final articles = ref.watch(articleProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: articles.when(
          data: (data){
           return ListView.builder(
             itemCount: data.length,
               itemBuilder: (context, index){
               return customListTile(data[index], context);
               }
           );
          },
          error: (e,s)=>Text("Error occurred loading data. $s"),
          loading: () => const Center(child:CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onButtonPressed,
        tooltip: 'Press Now',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}