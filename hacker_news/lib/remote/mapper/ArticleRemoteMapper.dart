import 'package:hacker_news/data/model/ArticleEntity.dart';
import 'package:hacker_news/remote/mapper/Mapper.dart';
import 'package:hacker_news/remote/model/RemoteArticle.dart';

/// Map a [RemoteArticle] to a [ArticleEntity] instance
/// when data is moving from the remote later to the Data layer
class ArticleRemoteMapper implements Mapper<RemoteArticle, ArticleEntity> {
  @override
  ArticleEntity mapFromRemote(RemoteArticle type) {
    return ArticleEntity(type.id, type.title, type.type, type.descendants);
  }
}
