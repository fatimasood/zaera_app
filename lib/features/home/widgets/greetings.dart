import 'package:flutter/material.dart';

class Greetings extends StatelessWidget {
  final String userName;
  const Greetings({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        //greetings + user name
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hey! $userName👋',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Text(
          'Ready to split smart?',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          'Peace over pennies, one tap at a time.',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
