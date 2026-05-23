import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../assets/data/models/asset_model.dart';


class AssetInsuranceCard extends StatelessWidget {
  final AssetModel asset;
  final VoidCallback onAddInsurance;

  const AssetInsuranceCard({
    super.key,
    required this.asset,
    required this.onAddInsurance,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final policy = asset.insurancePolicy;
    final requiresInsurance = asset.resolvedCategory?.requiresInsurance == true;

    /// ===============================
    /// NO POLICY
    /// ===============================
    if (policy == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.security,
                    color: AppTheme.primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  t.translate('no_insurance'),
                  style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(
              requiresInsurance
                  ? t.translate(
                      'insurance_required_for',
                      params: {'asset': asset.title},
                    )
                  : t.translate('insurance_optional'),
              style: AppTheme.caption.copyWith(
                color: requiresInsurance ? AppTheme.errorColor : Colors.grey,
              ),
            ),

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onAddInsurance,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  requiresInsurance
                      ? t.translate('add_insurance')
                      : t.translate('add_optional'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    /// ===============================
    ///  HAS POLICY
    /// ===============================
    final isActive = policy.active;
    final expiryDate = DateFormat('dd MMM yyyy').format(policy.expiryDate);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive
              ? [Colors.green.shade50, Colors.green.shade100]
              : [Colors.orange.shade50, Colors.orange.shade100],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? Colors.green.shade200 : Colors.orange.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isActive ? Icons.security : Icons.warning,
                color: isActive ? Colors.green : Colors.orange,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  policy.provider,
                  style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isActive ? t.translate('active') : t.translate('expiring'),
                  style: AppTheme.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            '${t.translate('policy')}: ${policy.policyNumber}',
            style: AppTheme.caption,
          ),

          const SizedBox(height: 4),

          Text(
            '${t.translate('expiry')}: $expiryDate',
            style: AppTheme.caption,
          ),
        ],
      ),
    );
  }
}
// class AssetInsuranceCard extends StatelessWidget {
//   final AssetModel asset;
//   final VoidCallback onAddInsurance;

//   const AssetInsuranceCard({
//     super.key,
//     required this.asset,
//     required this.onAddInsurance,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);
//     final policy = asset.insurancePolicy;

//     if (policy == null) {
//       return Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade50,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade200),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: AppTheme.primaryColor.withValues(alpha: 0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.security,
//                     color: AppTheme.primaryColor,
//                     size: 24,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Text(
//                   t.translate('no_insurance'),
//                   style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Text(
//                 t.translate(
//                   'insurance_required_for',
//                   params: {'asset': asset.title},
//                 ),
//                 style: AppTheme.caption,
//               ),

//             const SizedBox(height: 12),

//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 onPressed: onAddInsurance,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppTheme.primaryColor,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 10,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(t.translate('add')),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     final isActive = policy.active;
//     final expiryDate = DateFormat('dd MMM yyyy').format(policy.expiryDate);

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: isActive
//               ? [Colors.green.shade50, Colors.green.shade100]
//               : [Colors.orange.shade50, Colors.orange.shade100],
//         ),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: isActive ? Colors.green.shade200 : Colors.orange.shade200,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 isActive ? Icons.security : Icons.warning,
//                 color: isActive ? Colors.green : Colors.orange,
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   policy.provider,
//                   style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: isActive ? Colors.green : Colors.orange,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   isActive ? t.translate('active') : t.translate('expiring'),
//                   style: AppTheme.caption.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           Text(
//             '${t.translate('policy')}: ${policy.policyNumber}',
//             style: AppTheme.caption,
//           ),

//           const SizedBox(height: 4),

//           Text(
//             '${t.translate('expiry')}: $expiryDate',
//             style: AppTheme.caption,
//           ),

//           // const SizedBox(height: 8),

//           // Align(
//           //   alignment: Alignment.centerRight,
//           //   child: TextButton(
//           //     onPressed: () {},
//           //     child: Text(t.translate('view_details')),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
