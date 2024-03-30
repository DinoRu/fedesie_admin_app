import 'package:json_annotation/json_annotation.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'titre')
  String? titre;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'categorie')
  String? categorie;

  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'heure')
  String? heure;

  @JsonKey(name: 'place')
  String? place;

  Activity({
    this.id,
    this.titre,
    this.categorie,
    this.description,
    this.date,
    this.place,
    this.heure,
    this.image
  });

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);


}