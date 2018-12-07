class RecipePuppyResponse {
  String title;
  double version;
  String href;
  List<Results> results;

  RecipePuppyResponse({this.title, this.version, this.href, this.results});

  RecipePuppyResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    version = json['version'];
    href = json['href'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['version'] = this.version;
    data['href'] = this.href;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String title;
  String href;
  String ingredients;
  String thumbnail;

  Results({this.title, this.href, this.ingredients, this.thumbnail});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    href = json['href'];
    ingredients = json['ingredients'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['href'] = this.href;
    data['ingredients'] = this.ingredients;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
