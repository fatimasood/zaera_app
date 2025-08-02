import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/models/group_model.dart';

class PercentageSplitInfo extends StatefulWidget {
  const PercentageSplitInfo({super.key});

  @override
  State<PercentageSplitInfo> createState() => _PercentageSplitInfoState();
}

class _PercentageSplitInfoState extends State<PercentageSplitInfo> {
  int leftoveramount = 0;

  //final TextEditingController _amountController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Members",
                      style: GoogleFonts.urbanist(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brown,
                      ),
                    ),
                  ),
                  Text(
                    "Percentage",
                    style: GoogleFonts.urbanist(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brown,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "Paied",
                    style: GoogleFonts.urbanist(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brown,
                    ),
                  ),
                ],
              ),
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
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _members.length,
                      itemBuilder:
                          (context, index) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  member.name,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.brown,
                                  ),
                                ),
                              ),
                              Text(
                                "${member.price}%",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.brown,
                                ),
                              ),
                              const SizedBox(width: 65),
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
                    );
                  }),
                ),
              ),
            ),
            //text
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your splitting percentage must be 100%  of total amount.",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.tealGreen,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
