import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionProvider = NotifierProvider<SessionController, int>(
  SessionController.new,
);

class SessionController extends Notifier<int> {
  @override
  int build() => 0;

  void resetSession() {
    state++;
  }
}
