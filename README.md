# flutter_app

A new Flutter application.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
Prequist to use this repository :

- This repository is using [json serializer](https://pub.dartlang.org/packages/json_serializable) dependency which generate model class from json by [build runner](https://pub.dartlang.org/packages/build_runner) dependency. So the generated files will have *.g.dart* extension. This files are ignored from .gitIgnore because it can be generated by command _flutter packages pub run build_runner build_. 


### Generate Json Model class
To auto generate dart class we can use below File template.

```
import 'package:json_annotation/json_annotation.dart';
part '${NAME}.g.dart';
/*
 * run 
 * flutter packages pub run build_runner build
 * to auto generate model file 
 */
 
@JsonSerializable()
class ${CLASS_NAME} {
 
 /*
 * Add variables here
 */
 
 const ${CLASS_NAME}();
 factory ${CLASS_NAME}.fromJson(Map jsonMap) => _${DS}${CLASS_NAME}FromJson(jsonMap);
 Map<String, dynamic> toJson() => _${DS}${CLASS_NAME}ToJson(this);
}
```
### Explore Flutter Plugins :

Explore all usefull flutter plugins provided by google from [hear](https://github.com/flutter/plugins)
