import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/models/group_model.dart';

class EqualSplitInfo extends StatefulWidget {
  const EqualSplitInfo({super.key});

  @override
  State<EqualSplitInfo> createState() => _EqualSplitInfoState();
}

class _EqualSplitInfoState extends State<EqualSplitInfo> {
  int leftoveramount = 0;

  final TextEditingController _amountController = TextEditingController();

  final List<Member> _members = [
    Member(name: 'Marium', hasPaid: true, price: 0),
    Member(name: 'Aliya', hasPaid: false, price: 0),
    Member(name: 'Fatima', hasPaid: false, price: 0),
    Member(name: 'Hafsa', hasPaid: true, price: 0),
    Member(name: 'Khadija', hasPaid: false, price: 0),
    Member(name: 'Kalsoom', hasPaid: false, price: 0),
  ];

  void _togglePayment(int index) {
    setState(() {
      _members[index].hasPaid = !_members[index].hasPaid;
    });
  }

  void _calculateSplit(int amount) {
    final perPerson = amount ~/ _members.length;
    final reminder = amount % _members.length;

    setState(() {
      for (var m in _members) {
        m.price = perPerson;
      }
      leftoveramount = reminder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        // Scrollable List
        Container(
          height: 290,
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
                        Text(
                          "${member.price} PKR",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.brown,
                          ),
                        ),
                        Checkbox(
                          checkColor: AppColors.background,
                          activeColor: AppColors.musteredGreen,
                          hoverColor: AppColors.tealGreen,
                          side: BorderSide(
                            color: AppColors.musteredGreen,
                            width: 1.75,
                          ),

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
      ],
    );
  }
}
