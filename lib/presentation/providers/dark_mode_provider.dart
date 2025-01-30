import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class DarkModeProvider extends _$DarkModeProvider {
  @override
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}
