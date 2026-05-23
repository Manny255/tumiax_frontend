// lib/features/profile/presentation/widgets/kyc_documents_step.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../shared/document_uploader/document_uploader.dart';
import '../../../../shared/document_uploader/models/uploader_types.dart';

class KYCDocumentsStep extends HookWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<File?> idFrontFile;
  final ValueNotifier<File?> idBackFile;
  final ValueNotifier<File?> selfieFile;
  final ValueNotifier<File?> proofOfAddressFile;
  final Animation<double> fadeAnimation;
  final String userId;

  const KYCDocumentsStep({
    super.key,
    required this.formKey,
    required this.idFrontFile,
    required this.idBackFile,
    required this.selfieFile,
    required this.proofOfAddressFile,
    required this.fadeAnimation,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return FadeTransition(
      opacity: fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Animation
                Center(
                  child: Container(
                    height: 150,
                    child: Lottie.asset(
                      'assets/animations/upload.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.cloud_upload,
                          size: 80,
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(t.translate('upload_documents'), style: AppTheme.heading3),
                const SizedBox(height: 8),
                Text(
                  t.translate('documents_subtitle'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                /// ID FRONT - Image only (camera or gallery)
                DocumentUploader(
                  title: t.translate('id_front'),
                  uploaderType: UploaderType.kyc,
                  pickType: FilePickType.imageOnly,
                  fileNotifier: idFrontFile,
                  icon: Icons.credit_card,
                  userId: userId,
                ),
                const SizedBox(height: 16),

                /// ID BACK - Image only (camera or gallery)
                DocumentUploader(
                  title: t.translate('id_back'),
                  uploaderType: UploaderType.kyc,
                  pickType: FilePickType.imageOnly,
                  fileNotifier: idBackFile,
                  icon: Icons.credit_card,
                  userId: userId,
                ),
                const SizedBox(height: 16),

                /// SELFIE - SECURE: Camera only with watermark (front camera)
                DocumentUploader(
                  title: t.translate('selfie_photo'),
                  uploaderType: UploaderType.kyc,
                  pickType:
                      FilePickType.selfieSecure,
                  fileNotifier: selfieFile,
                  userId: userId,
                  icon: Icons.face,
                ),
                const SizedBox(height: 16),

                /// PROOF OF ADDRESS - Image or PDF
                DocumentUploader(
                  title: t.translate('proof_of_address'),
                  uploaderType: UploaderType.kyc,
                  pickType: FilePickType.imageOrPdf, // Allows images and PDFs
                  fileNotifier: proofOfAddressFile,
                  icon: Icons.home_work,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:lottie/lottie.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/localization/app_localizations.dart';
// import 'kyc_document_uploader.dart';

// class KYCDocumentsStep extends HookWidget {
//   final GlobalKey<FormState> formKey;
//   final ValueNotifier<File?> idFrontFile;
//   final ValueNotifier<File?> idBackFile;
//   final ValueNotifier<File?> selfieFile;
//   final ValueNotifier<File?> proofOfAddressFile;
//   final Animation<double> fadeAnimation;
//   final String userId;

//   const KYCDocumentsStep({
//     super.key,
//     required this.formKey,
//     required this.idFrontFile,
//     required this.idBackFile,
//     required this.selfieFile,
//     required this.proofOfAddressFile,
//     required this.fadeAnimation,
//     required this.userId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);

//     return FadeTransition(
//       opacity: fadeAnimation,
//       child: Padding(
//         padding: const EdgeInsets.all(
//             AppTheme.defaultPadding),
//         child: Form(
//           key: formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               children: [
//                     Center(
//                   child: Container(
//                     height: 150,
//                     child: Lottie.asset(
//                       'assets/animations/upload.json',
//                       fit: BoxFit.contain,
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         height: 150,
//                         decoration: BoxDecoration(
//                           color: AppTheme.secondaryColor.withOpacity(0.1),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.cloud_upload,
//                           size: 80,
//                           color: AppTheme.secondaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   t.translate('upload_documents'),
//                   style: AppTheme.heading3,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   t.translate('documents_subtitle'),
//                   style: AppTheme.body2
//                       .copyWith(color: Colors.grey),
//                 ),
//                 const SizedBox(height: 24),

//                 /// ID FRONT
//                 KYCDocumentUploader(
//                   title: t.translate('id_front'),
//                   fileNotifier: idFrontFile,
//                   fileType: KycFileType.imageOnly,
//                   icon: Icons.credit_card,
//                 ),
//                 const SizedBox(height: 16),
//                 /// ID BACK
//                 KYCDocumentUploader(
//                   title: t.translate('id_back'),
//                   fileNotifier: idBackFile,
//                   fileType: KycFileType.imageOnly,
//                   icon: Icons.credit_card,
//                 ),
//                 const SizedBox(height: 16),
//                 /// SELFIE
//                 KYCDocumentUploader(
//                   title: t.translate('selfie_photo'),
//                   fileNotifier: selfieFile,
//                   fileType: KycFileType.selfieSecure,
//                   userId: userId,
//                   icon: Icons.face,
//                 ),
//                 const SizedBox(height: 16),
//                 /// PROOF OF ADDRESS
//                 KYCDocumentUploader(
//                   title: t.translate('proof_of_address'),
//                   fileNotifier: proofOfAddressFile,
//                   fileType: KycFileType.imageOrPdf,
//                   icon: Icons.home_work,
//                 ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
