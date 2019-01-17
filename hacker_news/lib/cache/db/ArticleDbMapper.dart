import 'package:hacker_news/cache/db/Db.dart';
import 'package:hacker_news/cache/model/CachedArticle.dart';

/// Maps a [CachedArticle] instance to and from a database entity [Map<String, dynamic>].
class ArticleDbMapper {

  /// Construct an instance of [Map<String, dynamic>] using the given [CachedArticle]
  Map<String, dynamic> mapToMapValues(CachedArticle model) {
    return {
      ArticleTable.ID: model.id,
      ArticleTable.TITLE: model.title,
      ArticleTable.TYPE: model.type
    };
  }

  /// Parse the [Map<String, dynamic>] instance to a [CachedArticle] instance.
  CachedArticle mapFromMapValues(Map<String, dynamic> values) {
    return CachedArticle(
        values[ArticleTable.ID],
        values[ArticleTable.TITLE],
        values[ArticleTable.TYPE]
    );
  }
}