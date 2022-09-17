import 'package:flutter/material.dart';

class BannerDemo extends StatefulWidget {
  const BannerDemo({Key? key}) : super(key: key);

  @override
  State<BannerDemo> createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
        elevation: 6,
        backgroundColor: Colors.white70,
        padding: const EdgeInsets.all(15),
        leading: const Icon(
          Icons.alarm,
          size: 40,
          color: Colors.blue,
        ),
        content: const Text('datadatadatadatadatadata'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('ok')),
          TextButton(onPressed: () {}, child: const Text('no')),
        ]);
  }
}
