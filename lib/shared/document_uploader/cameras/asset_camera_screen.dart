// lib/shared/widgets/document_uploader/cameras/asset_camera_screen.dart
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class AssetCameraScreen extends StatefulWidget {
  final String userId;
  final String? assetId;

  const AssetCameraScreen({super.key, required this.userId, this.assetId});

  @override
  State<AssetCameraScreen> createState() => _AssetCameraScreenState();
}

class _AssetCameraScreenState extends State<AssetCameraScreen> {
  late CameraController _controller;
  bool _isReady = false;
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();

      // Use back camera for asset photos
      final backCamera = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
      );

      _controller = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _controller.initialize();

      if (mounted) {
        setState(() => _isReady = true);
      }
    } catch (e) {
      // debugPrint("Camera initialization error: $e");
      if (mounted) {
        Navigator.pop(context, null);
      }
    }
  }

  Future<void> _takePicture() async {
    if (_isCapturing || !_controller.value.isInitialized) return;

    _isCapturing = true;

    try {
      final XFile captured = await _controller.takePicture();

      final bytes = await File(captured.path).readAsBytes();
      img.Image? original = img.decodeImage(bytes);

      if (original == null) {
        _isCapturing = false;
        return;
      }

      final timestamp = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      ).format(DateTime.now());

      final text =
          "Asset Verification\nAsset ID: ${widget.assetId ?? 'N/A'}\nUser: ${widget.userId}\n$timestamp\nTumiaX Secure";

      img.drawString(
        original,
        text,
        font: img.arial24,
        x: 20,
        y: original.height - 140,
        color: img.ColorRgb8(255, 255, 255),
      );

      final directory = await getTemporaryDirectory();
      final newPath =
          '${directory.path}/asset_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final newFile = await File(newPath).writeAsBytes(img.encodeJpg(original));

      // Stop camera BEFORE leaving
      await _controller.dispose();

      if (mounted) {
        Navigator.pop(context, newFile);
      }
    } catch (e) {
      // debugPrint("Camera capture error: $e");
    } finally {
      _isCapturing = false;
    }
  }

  @override
  void dispose() {
    if (_controller.value.isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CameraPreview(_controller),

          /// Live timestamp overlay (visual only)
          Positioned(
            bottom: 120,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black54,
              child: Text(
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: _takePicture,
                backgroundColor: Colors.white,
                child: const Icon(Icons.camera, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
