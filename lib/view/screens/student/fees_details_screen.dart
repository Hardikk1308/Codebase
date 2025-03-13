// import 'dart:math';
//
// import 'package:erp_school/data/models/response/fee_details.dart';
// import 'package:erp_school/services/fee_service.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class FeeDetailsScreen extends StatefulWidget {
//   const FeeDetailsScreen({super.key});
//
//   @override
//   State<FeeDetailsScreen> createState() => _FeeDetailsScreenState();
// }
//
// class _FeeDetailsScreenState extends State<FeeDetailsScreen> {
//   final ScrollController _scrollController = ScrollController();
//
//   late Future<FeeDetails> feeDetailsFuture;
//   final FeeService _feeService = FeeService();
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch fee details when the screen initializes
//     feeDetailsFuture = _feeService.fetchFeeDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(
//         title: 'fee_details'.tr,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: FutureBuilder<FeeDetails>(
//           future: feeDetailsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             } else {
//               final feeDetails = snapshot.data!;
//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Center(
//                       child: Row(
//                         children: [
//                           ClipOval(
//                             child: Image.asset(
//                               Images.profilePng,
//                               height: 80,
//                               width: 80,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 feeDetails.studentName,
//                                 style: interMedium.copyWith(
//                                   color: Theme.of(context).disabledColor,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 '${feeDetails.gradeName} , ${feeDetails.sectionName}',
//                                 style: interMedium.copyWith(
//                                   color: Theme.of(context).disabledColor,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               // Text(
//                               //   "9 th Sec B".tr,
//                               //   style: interMedium.copyWith(
//                               //     color: Theme.of(context).disabledColor,
//                               //     fontSize: 12,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Admission Number :",
//                         style: interMedium.copyWith(
//                           color: Theme.of(context).disabledColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         "${Random().nextInt(1000000)}",
//                         style: interMedium.copyWith(
//                           color: Theme.of(context).disabledColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 12),
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.onSecondary,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.calendar_month,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "January",
//                               style: interMedium.copyWith(
//                                 color: Theme.of(context).disabledColor,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 24,
//                               width: 24,
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                   shape: BoxShape.circle),
//                               child: Icon(
//                                 Icons.arrow_back,
//                                 color: Theme.of(context).primaryColor,
//                                 size: 12,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               height: 24,
//                               width: 24,
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                   shape: BoxShape.circle),
//                               child: Icon(
//                                 Icons.arrow_forward,
//                                 color: Theme.of(context).primaryColor,
//                                 size: 12,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 450,
//                     child: Theme(
//                       data: Theme.of(context).copyWith(
//                         scrollbarTheme: ScrollbarThemeData(
//                           thumbColor: MaterialStateProperty.all(
//                               Theme.of(context).primaryColor),
//                           trackColor: MaterialStateProperty.all(
//                               Colors.grey.shade300),
//                           trackBorderColor: MaterialStateProperty.all(
//                               Colors.grey.shade400),
//                         ),
//                       ),
//                       child: Scrollbar(
//                         thumbVisibility:
//                         true,
//                         trackVisibility: true,
//                         thickness: 8.0,
//                         radius: const Radius.circular(8.0),
//                         controller:
//                         _scrollController,
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           controller:
//                           _scrollController,
//                           child: Container(
//                             color: const Color(0xffF9FCFF),
//                             child: Table(
//                               border: TableBorder.all(),
//                               defaultColumnWidth: const FixedColumnWidth(120.0),
//                               children: [
//                                 TableRow(
//                                   decoration: const BoxDecoration(color: Colors.blueAccent),
//                                   children: [
//                                     _buildTableHeader('No'),
//                                     _buildTableHeader('Amount'),
//                                     _buildTableHeader('Due Date'),
//                                     // _buildTableHeader('First Amount'),
//                                     _buildTableHeader('Status'),
//                                     // _buildTableHeader('Second Amount'),
//                                     _buildTableHeader('Details'),
//                                   ],
//                                 ),
//                                 ...feeDetails.installmentDetailsList.map((installment) {
//                                   return TableRow(
//                                     children: [
//                                       _buildTableCell( installment.installmentNo.toString() ),
//                                       _buildTableCell(installment.installmentAmount.toString()),
//                                       _buildTableCell(installment.dueDate),
//                                       _buildStatus(paid: installment.installStatus == "Paid"),
//                                       _viewDetailsButton(),
//                                     ],
//                                   );
//                                 }).toList(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildTableHeader(String text) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Get.theme.primaryColor,
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             text,
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTableCell(String text) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             text,
//             textAlign: TextAlign.center,
//             style: interSemiBold.copyWith(fontSize: 14, color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildStatus({bool paid = false}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
//       height: 30,
//       width: 63,
//       decoration: BoxDecoration(
//         color:  paid ? Theme.of(context).splashColor : Theme.of(context).canvasColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Center(
//         child: Text(
//           paid ? 'Paid':'Unpaid',
//           textAlign: TextAlign.center,
//           style: interRegular.copyWith(fontSize: 12, color: Theme.of(context).cardColor),
//         ),
//       ),
//     );
//   }
//   Widget _viewDetailsButton() {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             'View Details',
//             textAlign: TextAlign.center,
//             style: interMedium.copyWith(fontSize: 12, color: Theme.of(context).primaryColor),
//           ),
//         ),
//       ),
//     );
//   }
//
// }


import 'package:erp_school/data/models/response/fee_details.dart';
import 'package:erp_school/services/fee_service.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeeDetailsScreen extends StatefulWidget {
  const FeeDetailsScreen({super.key});

  @override
  State<FeeDetailsScreen> createState() => _FeeDetailsScreenState();
}

class _FeeDetailsScreenState extends State<FeeDetailsScreen> {
  late Future<FeeDetails> feeDetailsFuture;
  final FeeService _feeService = FeeService();

  @override
  void initState() {
    super.initState();
    // Fetch fee details when the screen initializes
    feeDetailsFuture = _feeService.fetchFeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'fee_details'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<FeeDetails>(
          future: feeDetailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final feeDetails = snapshot.data!;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Images.profilePng,
                              height: 80,
                              width: 80,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                feeDetails.studentName,
                                style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${feeDetails.gradeName} , Section (${feeDetails.sectionName})',
                                style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 00),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Admission Number",
                  //         style: interMedium.copyWith(
                  //           color: Theme.of(context).disabledColor,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //       Text(
                  //         "${Random().nextInt(1000000)}",
                  //         style: interMedium.copyWith(
                  //           color: Colors.black38,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: feeDetails.installmentDetailsList.length,
                      itemBuilder: (context, index) {
                        final installment =
                            feeDetails.installmentDetailsList[index];
                        return _buildInstallmentCard(installment);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  // Helper function to build a card for each installment
  Widget _buildInstallmentCard(InstallmentDetails installment) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white, // White background for the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Installment Number (Large Heading)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Installment No: ${installment.installmentNo}',
                  style: interMedium.copyWith(
                    fontSize: 16, // Larger font size for the heading
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: installment.installStatus == "Paid"
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    installment.installStatus,
                    style: interMedium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: installment.installStatus == "Paid"
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Amount
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: interMedium.copyWith(
                        fontSize: 14, // Smaller font size for content
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${installment.installmentAmount} (₹)',
                      style: interMedium.copyWith(
                        fontSize: 14, // Smaller font size for content
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Due Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      installment.installStatus == "Paid"
                          ? "Paid Date"
                          : 'Due Date',
                      style: interMedium.copyWith(
                        fontSize: 14, // Smaller font size for content
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${installment.dueDate}',
                      style: interMedium.copyWith(
                        fontSize: 14, // Smaller font size for content
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Details',
                      style: interMedium.copyWith(
                        fontSize: 14,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          // View Details Button
        ],
      ),
    );
  }
}
