library recipe_results;

import 'package:json_annotation/json_annotation.dart';

part 'recipe_results.g.dart';

@JsonSerializable()
class RecipeResults {
  final String title;
  final String href;
  final String ingredients;
  final String thumbnail;

  const RecipeResults(this.title, this.href, this.ingredients, this.thumbnail);

  factory RecipeResults.fromJson(Map jsonMap) =>
      _$RecipeResultsFromJson(jsonMap);

  Map<String, dynamic> toJson() => _$RecipeResultsToJson(this);
}
