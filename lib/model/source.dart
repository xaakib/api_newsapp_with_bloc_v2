class SourceModel {
  final String title;
  final String id;

  SourceModel(this.title, this.id);
  SourceModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"];
}
