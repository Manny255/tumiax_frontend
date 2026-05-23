enum UploaderType {
  asset, // Multiple files, grid view, camera only for photos
  kyc, // Single file, list view, gallery allowed
}

enum FilePickType {
  imageOnly, // For KYC: camera or gallery
  imageOrPdf, // For documents
  selfieSecure, // For KYC selfie with watermark
  assetPhoto, // For asset: camera only with watermark (no gallery)
}
