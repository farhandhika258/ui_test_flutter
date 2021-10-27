import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: true, ignoreUnannotated: true, explicitToJson: true)
class Category {
  @JsonKey(name: 'name') String name;
  @JsonKey(name: 'url') String url;

  Category({
    this.name,
    this.url,
  });
}