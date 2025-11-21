import 'package:flutter_application_15cubit/newsapp/Data_jaom.dart';

abstract class Newstates {}

final class NewsInitial extends Newstates {}

final class NewsLoading extends Newstates {}

final class NewsLoaded extends Newstates {
  final Data_jaom news;
  NewsLoaded(this.news);
}

final class NewsError extends Newstates {
  final String message;
  NewsError(this.message);
}
