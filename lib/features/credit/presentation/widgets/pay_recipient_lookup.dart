import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../profile/data/models/kyc_lookup_model.dart';
import '../../../profile/presentation/controllers/kyc_lookup_controller.dart';
import 'recipient_lookup_card.dart';

class PayRecipientLookup extends HookConsumerWidget {
  final String email;
  final VoidCallback onCancel;
  final Function(KYCLookupModel recipient) onRecipientSelected;

  const PayRecipientLookup({
    super.key,
    required this.email,
    required this.onCancel,
    required this.onRecipientSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final lookupController = ref.read(kycLookupControllerProvider.notifier);

    final lookupState = ref.watch(kycLookupControllerProvider);

    useEffect(() {
      Future.microtask(() {
        lookupController.lookup(email);
      });

      return null;
    }, [email]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.translate("recipient_details"),
              style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
            ),
            TextButton.icon(
              onPressed: () {
                ref
                    .read(kycLookupControllerProvider.notifier)
                    .reset(); 
                onCancel();
              },
              icon: const Icon(Icons.close, size: 16),
              label: Text(t.translate("cancel")),
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// Result Card
        RecipientLookupCard(
          state: lookupState,
          onSelect: (lookup) {
            onRecipientSelected(lookup);
          },
          isAutoSelect: true,
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../profile/data/models/kyc_lookup_model.dart';
// import '../../../profile/presentation/controllers/kyc_lookup_controller.dart';
// import 'recipient_lookup_card.dart';

// class PayRecipientLookup extends ConsumerWidget {
//   final String email;
//   final VoidCallback onCancel;
//   final Function(KYCLookupModel recipient) onRecipientSelected;

//   const PayRecipientLookup({
//     super.key,
//     required this.email,
//     required this.onCancel,
//     required this.onRecipientSelected,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);
//     final lookupController = ref.read(kycLookupControllerProvider.notifier);

//     // Trigger lookup when email changes
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       lookupController.lookup(email);
//     });

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header with cancel option
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               t.translate("recipient_details"),
//               style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
//             ),
//             TextButton.icon(
//               onPressed: onCancel,
//               icon: const Icon(Icons.close, size: 16),
//               label: Text(t.translate("cancel")),
//               style: TextButton.styleFrom(foregroundColor: Colors.grey),
//             ),
//           ],
//         ),

//         const SizedBox(height: 12),

//         // Lookup Result Card (reusing from transfer page)
//         Consumer(
//           builder: (context, ref, child) {
//             final lookupState = ref.watch(kycLookupControllerProvider);

//             return RecipientLookupCard(
//               state: lookupState,
//               // onSelect: (lookup) {
//               //   // Do nothing - auto-select for pay
//               // },
//               onSelect: (lookup) {
//                 onRecipientSelected(lookup);
//               },
//               isAutoSelect: true,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
