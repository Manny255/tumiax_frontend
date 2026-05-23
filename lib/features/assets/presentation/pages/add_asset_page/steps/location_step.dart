import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:lottie/lottie.dart';

import '../../../../../../core/themes/app_theme.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/tumiax_text_field.dart';
import '../../../../../location/providers/location_provider.dart';

class LocationStep extends ConsumerStatefulWidget {
  final TextEditingController locationAddressController;
  final GlobalKey<FormState> formKey;
  final double fadeAnimation;

  const LocationStep({
    super.key,
    required this.locationAddressController,
    required this.formKey,
    required this.fadeAnimation,
  });

  @override
  ConsumerState<LocationStep> createState() => _LocationStepState();
}

class _LocationStepState extends ConsumerState<LocationStep> {
  final TextEditingController _gpsAddressController = TextEditingController();

  gmap.GoogleMapController? _mapController;

  @override
  void dispose() {
    _gpsAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final locationState = ref.watch(locationControllerProvider);

    ref.listen(locationControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (location) {
          if (location != null) {
            _gpsAddressController.text = location.gpsAddress;

            _mapController?.animateCamera(
              gmap.CameraUpdate.newLatLngZoom(
                gmap.LatLng(location.latitude, location.longitude),
                18,
              ),
            );
          }
        },
        error: (error, _) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.translate('location_fetch_failed')),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(widget.fadeAnimation),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Animation
                Center(
                  child: SizedBox(
                    height: 150,
                    child: Lottie.asset(
                      'assets/animations/location.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            size: 80,
                            color: AppTheme.accentColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Text(t.translate('location_info'), style: AppTheme.heading3),

                const SizedBox(height: 8),

                Text(
                  t.translate('location_info_desc'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                /// Warning Message
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          t.translate('location_warning_message'),
                          style: AppTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// Manual Address (Required)
                TumiaxTextField(
                  controller: widget.locationAddressController,
                  label: t.translate('address'),
                  hint: t.translate('address_hint'),
                  prefixIcon: Icons.location_on_outlined,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return t.translate('address_required');
                    }

                    if (value.trim().length < 5) {
                      return t.translate('address_too_short');
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// GPS Address (Required)
                TumiaxTextField(
                  controller: _gpsAddressController,
                  label: t.translate('detected_location'),
                  prefixIcon: Icons.gps_fixed,
                  readOnly: true,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return t.translate('location_required');
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// Get Location Button
                OutlinedButton.icon(
                  onPressed: locationState.isLoading
                      ? null
                      : () async {
                          final controller = ref.read(
                            locationControllerProvider.notifier,
                          );

                          await controller.getCurrentLocation();
                        },
                  icon: locationState.isLoading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.my_location),
                  label: Text(t.translate('get_my_location')),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryColor,
                    side: const BorderSide(color: AppTheme.primaryColor),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),

                const SizedBox(height: 20),

                /// Map Preview
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: locationState.when(
                      data: (location) {
                        if (location == null) {
                          return _mapPlaceholder(context);
                        }

                        return gmap.GoogleMap(
                          onMapCreated: (controller) {
                            _mapController = controller;
                          },
                          initialCameraPosition: gmap.CameraPosition(
                            target: gmap.LatLng(
                              location.latitude,
                              location.longitude,
                            ),
                            zoom: 18,
                          ),
                          markers: {
                            gmap.Marker(
                              markerId: const gmap.MarkerId("asset_location"),
                              position: gmap.LatLng(
                                location.latitude,
                                location.longitude,
                              ),
                            ),
                          },
                          zoomControlsEnabled: false,
                          myLocationEnabled: true,
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, _) {
                        final messageKey = error.toString().replaceAll(
                          'Exception: ',
                          '',
                        );

                        return Center(
                          child: Text(
                            t.translate(messageKey),
                            style: AppTheme.caption,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mapPlaceholder(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      color: Colors.grey.shade100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 40, color: Colors.grey.shade400),
            const SizedBox(height: 8),
            Text(
              t.translate('map_preview'),
              style: AppTheme.caption.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
