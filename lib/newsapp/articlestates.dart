abstract class ArticleState {}

class ArticleInitial extends ArticleState {}
class ArticleLoading extends ArticleState {}
class ArticleLoaded extends ArticleState {
  final dynamic article;
  ArticleLoaded(this.article);
}
class ArticleError extends ArticleState {
  final String message;
  ArticleError(this.message);
}
