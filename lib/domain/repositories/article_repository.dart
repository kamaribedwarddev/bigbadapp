import 'package:bigbadapp/domain/entities/article_entity.dart';


abstract class ArticleRepository {
  Future<List<Article>> getArticles();
  String getArticleByAuthor(String author);
}