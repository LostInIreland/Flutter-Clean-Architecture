/// Representation for a [Article] fetched from an external layer data source
class Article {
  int id;
  String title;
  ArticleType type;

  Article(this.type, this.title);

}

abstract class Enum<T> {
  final T value;
  const Enum(this.value);
}

/// This is the type of the article.
///
/// It can be any of these: "job", "story", "comment", "poll", or "pollopt".
class ArticleType extends Enum<String> {
  const ArticleType(String value) : super(value);

  static const ArticleType JOB = const ArticleType("job");
  static const ArticleType STORY = const ArticleType("story");
  static const ArticleType COMMENT = const ArticleType("comment");
  static const ArticleType POLL = const ArticleType("poll");
  static const ArticleType POLLOPT = const ArticleType("pollopt");
}