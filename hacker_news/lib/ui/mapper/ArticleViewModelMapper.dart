import 'package:hacker_news/presentation/model/ArticleView.dart';
import 'package:hacker_news/ui/mapper/Mapper.dart';
import 'package:hacker_news/ui/model/ArticleViewModel.dart';

/// Map a [ArticleView] to and from a [ArticleViewModel] instance
/// when data is moving between this layer and the Presentation layer
class ArticleViewModelMapper implements Mapper<ArticleView, ArticleViewModel> {
  @override
  ArticleViewModel mapToViewModel(ArticleView type) {
    return ArticleViewModel(type.title, type.type, type.descendants.toString());
  }
}
