class ArticleModel {
  final String author;
  final String title;
  final String descriptions;
  final String url;
  final String img;
  final String date;
  final String content;

  ArticleModel(this.author, this.title, this.descriptions, this.url, this.img,
      this.date, this.content);
  ArticleModel.fromJson(Map<String, dynamic> json)
      : author = json["author"],
        title = json["title"],
        descriptions = json["description"],
        url = json["url"],
        img = json["urlToImage"],
        date = json["publishedAt"],
        content = json["content"];
}
