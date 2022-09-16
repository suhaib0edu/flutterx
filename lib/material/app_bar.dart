import 'package:flutter/material.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              tooltip: 'menu', onPressed: () {}, icon: const Icon(Icons.menu));
        }),
        title: const Text('flutter'),
        actions: [
          IconButton(
              tooltip: 'telegram',
              onPressed: () {},
              icon: const Icon(Icons.telegram)),
          IconButton(
              tooltip: 'facebook',
              onPressed: () {},
              icon: const Icon(Icons.facebook)),
          IconButton(
              tooltip: 'youtube_searched_for',
              onPressed: () {},
              icon: const Icon(Icons.youtube_searched_for)),
          PopupMenuButton(itemBuilder: (cont) {
            return const [
              PopupMenuItem(child: Text('data1')),
              PopupMenuItem(child: Text('data2')),
              PopupMenuItem(child: Text('data3')),
              PopupMenuItem(child: Text('data4')),
            ];
          })
        ],
      ),
    );
  }
}
