/// Model used solely for the caching of an article
class CachedArticle {
  int id;
  String title;
  String type;
  int descendants;

  CachedArticle(this.id, this.title, this.type, this.descendants);
}
