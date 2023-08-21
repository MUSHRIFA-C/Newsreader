class Source{
  String? name;
  String? id;

  Source({this.id, this.name});
  factory Source.fromJson(Map<String , dynamic> json){
    return Source(
        name:  json['name'],
        id: json['id']
    );
  }
}