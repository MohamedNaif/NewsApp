import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/news_app/news_app.dart';
import '../../repository/news_app_repo.dart';

part 'news_app_state.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit() : super(NewsAppInitial());

  getNewsApp(String text) {
    emit(NewsAppLoading());

    NewsAppRepo().getNewsApp(text: text).then((value) {
      if (value != null) {
        emit(NewsAppSucsess(ourResponse: value));
      } else {
        emit(NewsAppErorr());
      }
    });
  }
}
