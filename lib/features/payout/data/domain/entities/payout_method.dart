class PayoutMethod {
  final int id;
  final String method;

  final String? bankName;
  final String? accountNumber;
  final String? accountHolder;
  final String? accountCurrency;
  final String? swiftCode;
  final String? routingNumber;
  final String? iban;

  final String? mobileWalletNumber;
  final String? mobileWalletProvider;
  final String? mobileWalletName;

  final bool isActive;
  final DateTime createdAt;
  final DateTime? activeFrom;

  const PayoutMethod({
    required this.id,
    required this.method,
    this.bankName,
    this.accountNumber,
    this.accountHolder,
    this.accountCurrency,
    this.swiftCode,
    this.routingNumber,
    this.iban,
    this.mobileWalletNumber,
    this.mobileWalletProvider,
    this.mobileWalletName,
    required this.isActive,
    required this.createdAt,
    this.activeFrom,
  });
}
