import 'package:flutter/material.dart';

String created_date = DateTime.now().toLocal().toString().split(' ')[0];

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Admin:",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Marium",
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(fontSize: 17),
                ),
              ],
            ),

            //show the dynamic date of cretion of the bill
            Column(
              children: [
                Text(
                  "Created on: ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  created_date,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
