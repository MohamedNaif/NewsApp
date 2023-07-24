import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/news_app/news_app.dart';
import '../../repository/news_app_repo.dart';

part 'news_screen_state.dart';

class NewsScreenCubitCubit extends Cubit<NewsScreenCubitState> {
  NewsScreenCubitCubit() : super(NewsScreenCubitInitial());

  get ourResponse => null;

  getNewsApp() {
    emit(NewsScreenCubitLoading());

    NewsAppRepo().getNewsApp().then((value) {
      if (value != null) {
        emit(NewsScreenCubitSucsess(ourResponse: value));
      } else {
        emit(NewsScreenCubitErorr());
      }
    });
  }
}
