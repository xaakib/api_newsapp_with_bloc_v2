class SourceModel {
  final String id;
  final String name;
  final String descriptions;
  final String url;
  final String category;
  final String language;
  final String country;

  SourceModel(this.id, this.name, this.descriptions, this.url, this.category,
      this.language, this.country);
  SourceModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        id = json["id"],
        descriptions = json["description"],
        url = json["url"],
        category = json["category"],
        language = json["language"],
        country = json["country"];
}
