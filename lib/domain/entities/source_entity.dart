//Creating the source model class
class Source {
  String id;
  String name;

  //Creating the constructor for the class
  Source({required this.id, required this.name});

  //creating the factory function to map json result
  factory Source.fromJson(Map<String,dynamic> json){
    return Source(
        id: json['id'] ?? '',
        name: json['name'] ?? ''
    );
  }
}