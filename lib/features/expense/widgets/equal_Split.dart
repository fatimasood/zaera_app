import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class EqualSplitInfo extends StatefulWidget {
  const EqualSplitInfo({super.key});

  @override
  State<EqualSplitInfo> createState() => _EqualSplitInfoState();
}

class _EqualSplitInfoState extends State<EqualSplitInfo> {
  final List<Member> _members = [
    Member(name: 'Marium', hasPaid: true),
    Member(name: 'Aliya', hasPaid: false),
    Member(name: 'Fatima', hasPaid: false),
    Member(name: 'hafsa', hasPaid: true),
    Member(name: 'khadija', hasPaid: false),
    Member(name: 'kalsoom', hasPaid: false),
  ];

  void _togglePayment(int index) {
    setState(() {
      _members[index].hasPaid = !_members[index].hasPaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Members",
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.brown,
                ),
              ),
              Text(
                "Send Reminder",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tealGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.brown, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(_members.length, (index) {
                    final member = _members[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              member.name,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.brown,
                              ),
                            ),
                            Checkbox(
                              value: member.hasPaid,
                              onChanged: (_) => _togglePayment(index),
                            ),
                          ],
                        ),
                        if (index != _members.length - 1)
                          Divider(
                            color: AppColors.brown.withOpacity(0.3),
                            thickness: 1,
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Member {
  final String name;
  bool hasPaid;

  Member({required this.name, this.hasPaid = false});
}
