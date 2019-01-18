
/// Representation for a [ArticleEntity] fetched from an external layer data source
class ArticleEntity {
  int id;
  String title;
  String type;
  int descendants;

  ArticleEntity(this.id, this.title, this.type, this.descendants);
}