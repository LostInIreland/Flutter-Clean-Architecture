/// This class defines the tables found within the application Database.
/// All table definitions should contain column names and a sequence for creating the table.
class ArticleTable {
  static const String TABLE_NAME = "tbl_article";

  static const String ID = "id";
  static const String TITLE = "title";
  static const String TYPE = "type";

  static const String CREATE = "CREATE TABLE " +
      TABLE_NAME +
      " (" +
      ID +
      " INTEGER PRIMARY KEY NOT NULL," +
      TITLE +
      " TEXT," +
      TYPE +
      " TEXT," +
      "); ";
}
