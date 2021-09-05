import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState());

  void toDark() => emit(state.copyWith(status: ThemeStatus.dark));
  void toLight() => emit(state.copyWith(status: ThemeStatus.light));
}
