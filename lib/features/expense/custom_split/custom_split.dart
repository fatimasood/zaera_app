import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/models/group_model.dart';
import 'package:zaera_app/models/products_model.dart';

class CustomSplitInfo extends StatefulWidget {
  const CustomSplitInfo({super.key});

  @override
  State<CustomSplitInfo> createState() => _CustomSplitInfoState();
}

class _CustomSplitInfoState extends State<CustomSplitInfo> {
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

  final List<ProductsModel> _products = [
    ProductsModel(productName: 'Chicken', hasSelected: true, price: 0),
    ProductsModel(productName: 'Vegetables', hasSelected: false, price: 0),
    ProductsModel(productName: 'Fruits', hasSelected: false, price: 0),
    ProductsModel(productName: 'A4 Pages', hasSelected: true, price: 0),
    ProductsModel(productName: 'Calender', hasSelected: false, price: 0),
    ProductsModel(productName: 'Kalsoom', hasSelected: false, price: 0),
  ];

  void _togglePayment(int index) {
    setState(() {
      _members[index].hasPaid = !_members[index].hasPaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonHeight = screenHeight * 0.06;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Members",
                style: GoogleFonts.urbanist(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
              Text(
                "Selected",
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
          height: 200,
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
                      "Products",
                      style: GoogleFonts.urbanist(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brown,
                      ),
                    ),
                  ),
                  Text(
                    "Price",
                    style: GoogleFonts.urbanist(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brown,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "Selected",
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
              height: 200,
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
                  children: List.generate(_products.length, (index) {
                    final products = _products[index];
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _products.length,
                      itemBuilder:
                          (context, index) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  products.productName,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.brown,
                                  ),
                                ),
                              ),
                              Text(
                                products.price.toString(),
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

                                value: products.hasSelected,
                                onChanged: (_) => _togglePayment(index),
                              ),
                            ],
                          ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        //split by
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "Split by >",
                style: GoogleFonts.urbanist(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.tealGreen,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                height: buttonHeight,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('home');
                    // Logic to trigger the split action
                  },
                  child: Text(
                    "Equally",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              SizedBox(
                height: buttonHeight,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('home');
                    // Logic to trigger the split action
                  },
                  child: Text(
                    "By Percentage",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
