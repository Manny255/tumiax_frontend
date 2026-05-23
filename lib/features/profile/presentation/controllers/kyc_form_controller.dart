import 'dart:io';
import 'package:flutter_hooks/flutter_hooks.dart';

class KYCFormControllers {
  // Personal Info
  final fullNameController = useTextEditingController();
  final emailController = useTextEditingController();
  final phoneController = useTextEditingController();
  final dateOfBirthController = useTextEditingController();
  final nationalityController = useTextEditingController(text: 'TZ');

  // Address
  final addressController = useTextEditingController();
  final cityController = useTextEditingController();
  final stateController = useTextEditingController();
  final postalCodeController = useTextEditingController();
  final countryController = useTextEditingController(text: 'TZ');

  // Employment
  final employmentStatusController = useTextEditingController(text: 'EMPLOYED');
  final occupationController = useTextEditingController();
  final employerController = useTextEditingController();
  final annualIncomeController = useTextEditingController();

  // ID
  final idTypeController = useTextEditingController(text: 'NATIONAL_ID');
  final idNumberController = useTextEditingController();
  final idCountryController = useTextEditingController(text: 'TZ');
  final idExpiryDateController = useTextEditingController();

  // Files
  final idFrontFile = useState<File?>(null);
  final idBackFile = useState<File?>(null);
  final selfieFile = useState<File?>(null);
  final proofOfAddressFile = useState<File?>(null);

  void clearAll() {
    // Personal Info
    fullNameController.clear();
    phoneController.clear();
    dateOfBirthController.clear();
    nationalityController.clear();

    // Address
    addressController.clear();
    cityController.clear();
    stateController.clear();
    postalCodeController.clear();
    countryController.clear();

    // Employment
    employmentStatusController.clear();
    occupationController.clear();
    employerController.clear();
    annualIncomeController.clear();

    // ID Info
    idTypeController.clear();
    idNumberController.clear();
    idCountryController.clear();
    idExpiryDateController.clear();

    // Files
    idFrontFile.value = null;
    idBackFile.value = null;
    selfieFile.value = null;
    proofOfAddressFile.value = null;
  }

}
