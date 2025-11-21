import 'package:flutter_application_15cubit/newsapp/articlestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

 
  void fetchArticle(dynamic article) async {
    try {
      emit(ArticleLoading());
      await Future.delayed(Duration(seconds: 1)); 
      emit(ArticleLoaded(article));
    } catch (e) {
      emit(ArticleError("Failed to load article"));
    }
  }
}
