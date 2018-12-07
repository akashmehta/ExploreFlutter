library recipe_response;

import 'package:flutter_app/apiIntegrationUsingDart/recipe_results.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_puppy_response.g.dart';

@JsonSerializable()
class RecipePuppyResponse {
  final String title;
  final double version;
  final String href;
  final List<RecipeResults> results;

  const RecipePuppyResponse(this.title, this.version, this.href, this.results);

  factory RecipePuppyResponse.fromJson(Map jsonMap) => _$RecipePuppyResponseFromJson(jsonMap);

  Map<String, dynamic> toJson() => _$RecipePuppyResponseToJson(this);
}

