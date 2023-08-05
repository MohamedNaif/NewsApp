import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'them_state.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void toggleTheme() {
    emit(!state);
  }
}
