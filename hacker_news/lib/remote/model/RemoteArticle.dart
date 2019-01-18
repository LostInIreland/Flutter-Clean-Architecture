/// Representation for a [RemoteArticle] fetched from the API
class RemoteArticle {
  int id;
  String title;
  String type;
  int descendants;

  RemoteArticle(this.id, this.title, this.type, this.descendants);

  factory RemoteArticle.fromJson(Map<String, dynamic> json) {
    return RemoteArticle(
      json['id'],
      json['title'],
      json['type'],
      json['descendants']
    );
  }
}