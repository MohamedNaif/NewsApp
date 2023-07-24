part of 'news_screen_cubit.dart';

@immutable
abstract class NewsScreenCubitState {}

class NewsScreenCubitInitial extends NewsScreenCubitState {}

class NewsScreenCubitLoading extends NewsScreenCubitState {}

class NewsScreenCubitErorr extends NewsScreenCubitState {}

class NewsScreenCubitSucsess extends NewsScreenCubitState {
  final NewsApp ourResponse;
  NewsScreenCubitSucsess({required this.ourResponse});
}
