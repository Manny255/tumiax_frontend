// presentation/pages/add_asset_page/steps/insurance_step_wrapper.dart

import 'package:flutter/material.dart';
import '../../../../data/models/asset_model.dart';
import '../../../widgets/post_asset_insurance_step.dart';

class InsuranceStepWrapper extends StatelessWidget {
  final AssetModel? asset;
  final GlobalKey<FormState> formKey;
  final VoidCallback onComplete;
  final VoidCallback onSkip;

  const InsuranceStepWrapper({
    super.key,
    required this.asset,
    required this.formKey,
    required this.onComplete,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    if (asset == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return PostAssetInsuranceStep(
      asset: asset!,
      formKey: formKey,
      onComplete: onComplete,
      onSkip: onSkip,
    );
  }
}
