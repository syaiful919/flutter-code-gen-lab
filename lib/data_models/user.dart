import 'package:json_annotation/json_annotation.dart';
import 'package:lab/data_models/address.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String name;

  @JsonKey(name: 'nick-name')
  final String nickName;

  @JsonKey(name: 'dob')
  final DateTime? dateOfBirth;

  final Address? address;

  User({
    required this.name,
    required this.nickName,
    this.dateOfBirth,
    this.address,
  });

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
