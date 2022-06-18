// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      nickName: json['nick-name'] as String,
      dateOfBirth:
          json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'nick-name': instance.nickName,
      'dob': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address?.toJson(),
    };
