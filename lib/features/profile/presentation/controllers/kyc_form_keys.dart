import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KYCFormKeys {
  final personalInfoFormKey = useMemoized(() => GlobalKey<FormState>());

  final addressFormKey = useMemoized(() => GlobalKey<FormState>());

  final employmentFormKey = useMemoized(() => GlobalKey<FormState>());

  final idFormKey = useMemoized(() => GlobalKey<FormState>());

  final documentsFormKey = useMemoized(() => GlobalKey<FormState>());
}
