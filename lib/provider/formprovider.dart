import 'package:flutter_riverpod/flutter_riverpod.dart';

class Passwordnotifier extends StateNotifier<bool> {
  Passwordnotifier() : super(true);
  void toggleObscured() {
    state = !state;
  }
}

final passwordObscureProvider =
    StateNotifierProvider<Passwordnotifier, bool>((ref) => Passwordnotifier());
