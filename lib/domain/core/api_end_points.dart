import 'package:project_netflix/core/strings.dart';
import 'package:project_netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
