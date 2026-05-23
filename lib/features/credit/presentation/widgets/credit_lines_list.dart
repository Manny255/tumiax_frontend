// import 'package:flutter/material.dart';

// import '../../../../core/themes/app_theme.dart';
// import '../../data/models/credit_line_model.dart';
// import 'credit_line_card.dart';

// class CreditLinesList extends StatelessWidget {
//   final List<CreditLineModel> creditLines;

//   const CreditLinesList({super.key, required this.creditLines});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 180,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(
//           horizontal: AppTheme.defaultPadding,
//         ),
//         itemCount: creditLines.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: CreditLineCard(creditLine: creditLines[index]),
//           );
//         },
//       ),
//     );
//   }
// }
