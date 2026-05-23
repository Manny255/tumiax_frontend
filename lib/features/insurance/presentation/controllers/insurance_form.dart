import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/create_insurance_request.dart';
import '../../providers/insurance_providers.dart';


class InsuranceFormController {
  final TextEditingController providerController;
  final TextEditingController policyController;
  final TextEditingController expiryController;
  final TextEditingController startController;
  final TextEditingController coverageController;
  final TextEditingController premiumController;
  final TextEditingController notesController;

  final ValueNotifier<bool> insuranceActive;
  final ValueNotifier<String?> premiumFrequency;
  final ValueNotifier<List<File>> documents;
  final ValueNotifier<bool> isLoading;

  final Future<void> Function(String assetId) submit;

  InsuranceFormController({
    required this.providerController,
    required this.policyController,
    required this.expiryController,
    required this.startController,
    required this.coverageController,
    required this.premiumController,
    required this.notesController,
    required this.insuranceActive,
    required this.premiumFrequency,
    required this.documents,
    required this.isLoading,
    required this.submit,
  });
}

InsuranceFormController useInsuranceForm(WidgetRef ref) {
  final providerController = useTextEditingController();
  final policyController = useTextEditingController();
  final expiryController = useTextEditingController();
  final startController = useTextEditingController();
  final coverageController = useTextEditingController();
  final premiumController = useTextEditingController();
  final notesController = useTextEditingController();

  final insuranceActive = useState(true);
  final premiumFrequency = useState<String?>('ANNUALLY');

  final documents = useState<List<File>>([]);
  final isLoading = useState(false);

  Future<void> submit(String assetId) async {
    if (expiryController.text.isEmpty) {
      throw Exception("Expiry date required");
    }

    isLoading.value = true;

    final request = CreateInsuranceRequest(
      assetId: assetId,
      provider: providerController.text.trim(),
      policyNumber: policyController.text.trim(),
      expiryDate: DateTime.parse(expiryController.text),
      startDate: startController.text.isNotEmpty
          ? DateTime.parse(startController.text)
          : null,
      active: insuranceActive.value,
      coverageAmount: coverageController.text.isNotEmpty
          ? double.parse(coverageController.text)
          : null,
      premiumAmount: premiumController.text.isNotEmpty
          ? double.parse(premiumController.text)
          : null,
      premiumFrequency: premiumFrequency.value,
      notes: notesController.text.isNotEmpty ? notesController.text : null,
    );

    final controller = ref.read(insuranceControllerProvider.notifier);

    final policy = await controller.createInsurance(request);

    if (policy != null) {
      for (var file in documents.value) {
        await controller.uploadDocument(policy.id, file);
      }
    }
    isLoading.value = false;
  }

  return InsuranceFormController(
    providerController: providerController,
    policyController: policyController,
    expiryController: expiryController,
    startController: startController,
    coverageController: coverageController,
    premiumController: premiumController,
    notesController: notesController,
    insuranceActive: insuranceActive,
    premiumFrequency: premiumFrequency,
    documents: documents,
    isLoading: isLoading,
    submit: submit,
  );
}
