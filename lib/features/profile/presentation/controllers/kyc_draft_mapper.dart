
import '../../data/models/kyc_model.dart';
import 'kyc_form_controller.dart';

class KYCDraftMapper {
  static void populateFromDraft(KYCDraft draft, KYCFormControllers c) {
    c.fullNameController.text = draft.personalInfo['fullName'] ?? '';
    c.emailController.text = draft.personalInfo['email'] ?? '';
    c.phoneController.text = draft.personalInfo['phone'] ?? '';
    c.dateOfBirthController.text = draft.personalInfo['dateOfBirth'] ?? '';
    c.nationalityController.text = draft.personalInfo['nationality'] ?? 'TZ';

    c.addressController.text = draft.addressInfo['address'] ?? '';
    c.cityController.text = draft.addressInfo['city'] ?? '';
    c.stateController.text = draft.addressInfo['state'] ?? '';
    c.postalCodeController.text = draft.addressInfo['postalCode'] ?? '';
    c.countryController.text = draft.addressInfo['country'] ?? 'TZ';

    c.employmentStatusController.text =
        draft.employmentInfo['employmentStatus'] ?? 'EMPLOYED';
    c.occupationController.text = draft.employmentInfo['occupation'] ?? '';
    c.employerController.text = draft.employmentInfo['employer'] ?? '';
    c.annualIncomeController.text = draft.employmentInfo['annualIncome'] ?? '';

    c.idTypeController.text = draft.idInfo['idType'] ?? 'NATIONAL_ID';
    c.idNumberController.text = draft.idInfo['idNumber'] ?? '';
    c.idCountryController.text = draft.idInfo['idCountry'] ?? 'TZ';
    c.idExpiryDateController.text = draft.idInfo['idExpiryDate'] ?? '';
  }
}
