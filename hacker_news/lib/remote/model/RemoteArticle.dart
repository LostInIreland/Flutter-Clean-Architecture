/// Representation for a [RemoteArticle] fetched from the API
class RemoteArticle {
  int id;
  String title;
  String type;

  RemoteArticle(this.id, this.title, this.type);

  factory RemoteArticle.fromJson(Map<String, dynamic> json) {
    return RemoteArticle(
      json['id'],
      json['title'],
      json['type']
    );
  }
}