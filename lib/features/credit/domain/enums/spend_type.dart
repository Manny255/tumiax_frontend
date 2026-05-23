/// Defines all supported credit spend operations.
///
/// IMPORTANT:
/// The string values MUST match backend SpendSerializer choices.
enum SpendType { pay, transferInternal, transferExternal, purchase }

extension SpendTypeX on SpendType {
  /// Backend API value
  String get apiValue {
    switch (this) {
      case SpendType.pay:
        return "PAY";
      case SpendType.transferInternal:
        return "TRANSFER_INT";
      case SpendType.transferExternal:
        return "TRANSFER_EXT";
      case SpendType.purchase:
        return "PURCHASE";
    }
  }

  ///readable name (useful for logs / debug)
  String get name {
    switch (this) {
      case SpendType.pay:
        return "Pay";
      case SpendType.transferInternal:
        return "Internal Transfer";
      case SpendType.transferExternal:
        return "External Transfer";
      case SpendType.purchase:
        return "Purchase";
    }
  }
}
