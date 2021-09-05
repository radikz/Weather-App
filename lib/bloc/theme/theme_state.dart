part of 'theme_cubit.dart';

enum ThemeStatus {dark, light}

class ThemeState {
  const ThemeState({this.status = ThemeStatus.light});
  final ThemeStatus status;

  ThemeState copyWith({ThemeStatus? status}) {
    return ThemeState(status: status ?? this.status);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'ThemeState { status $status }} }';
  }
}