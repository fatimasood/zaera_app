import 'package:flutter/material.dart';
import 'package:zaera_app/features/group/widgets/all_groups_card.dart';

class AllGroups extends StatelessWidget {
  const AllGroups({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double spacing(double factor) => screenHeight * factor;

    return Scaffold(
      appBar: AppBar(title: Text("Zaera Circles")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [AllGroupsCard(), SizedBox(height: spacing(0.01))],
            ),
          ),
        ),
      ),
    );
  }
}
