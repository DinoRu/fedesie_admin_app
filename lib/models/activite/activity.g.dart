// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: json['id'] as String?,
      titre: json['titre'] as String?,
      categorie: json['categorie'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      place: json['place'] as String?,
      heure: json['heure'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'titre': instance.titre,
      'description': instance.description,
      'categorie': instance.categorie,
      'date': instance.date,
      'image': instance.image,
      'heure': instance.heure,
      'place': instance.place,
    };
