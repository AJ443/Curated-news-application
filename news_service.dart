import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class NewsService {
  static const String _apiKey = 'dd462ec0f5c8464297e484e7925fea4e';
  static const String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchArticles(List<String> categories) async {
    final category = categories.isNotEmpty
        ? categories.first.toLowerCase()
        : 'general';
    final url = Uri.parse(
      '$_baseUrl/top-headlines?country=us&category=$category&apiKey=$_apiKey',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articlesJson = data['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
