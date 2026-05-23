class RouteHelpers {
  // Asset routes
  static String assetDetail(String id) => '/assets/$id';
  static String editAsset(String id) => '/assets/$id/edit';
  static String assetDocuments(String id) => '/assets/$id/documents';
  static String assetDocumentView(String assetId, String docId) =>
      '/assets/$assetId/documents/$docId';
  static String assetValuation(String id) => '/assets/$id/valuation';

    // Insurance routes
  static String addInsurance({String? assetId, String? assetTitle}) {
    if (assetId != null && assetTitle != null) {
      return '/insurance/add?assetId=$assetId&assetTitle=${Uri.encodeComponent(assetTitle)}';
    }
    return '/insurance/add';
  }


  // Check if current route matches pattern
  static bool isAssetDetail(String location) =>
      RegExp(r'^/assets/[\w-]+$').hasMatch(location);

  static bool isEditAsset(String location) =>
      RegExp(r'^/assets/[\w-]+/edit$').hasMatch(location);
}
