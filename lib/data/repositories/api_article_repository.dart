
import 'package:bigbadapp/domain/entities/article_entity.dart';
import 'package:bigbadapp/domain/repositories/article_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../remote/api_service.dart';

final articleProvider = FutureProvider.autoDispose((ref) async {

  final apiService = ref.read(articleServiceProvider);
  //SOLID
  // Liskov Substitution Principle - subclass is replaceable with superclass
  ArticleRepository apiArticleRepository = ApiArticleRepository(apiService: apiService);
  return apiArticleRepository.getArticles();
});

//SOLID
// S - Single Responsibility Principle
// This classes sole purpose is to return articles returned from the api service
// O - Open closed principle - If we want to also get Articles from a different data source,
// we just have to create another repository and extend the ArticleRepository
class ApiArticleRepository extends ArticleRepository{

  ApiService apiService;

  ApiArticleRepository({required this.apiService});

  @override
  Future<List<Article>> getArticles() {
    return apiService.getArticle();
  }

  //SOLID
  // Interface Segregation Principle
  //ApiArticleRepository is not forced to implement the getArticleByAuthor function, as it is not needed.
  @override
  String getArticleByAuthor(String author) {
    // TODO: implement getArticleByAuthor
    throw UnimplementedError();
  }

}