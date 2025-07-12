import 'package:flutter/material.dart';

class ZaeraApp extends StatelessWidget {
  const ZaeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zaera',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('Zaera Home')),
          body: Center(child: const Text('Welcome to Zaera!')),
        ),
      ),
    );
  }
}
