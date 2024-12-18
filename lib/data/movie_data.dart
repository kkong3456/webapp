import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webapp/model/movie_model.dart';

class MovieData {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDIwZGMwODhmNDhhOWI0ODkxMzM1MWFmZTM2YzI3OSIsIm5iZiI6MTczNDQxODY4My42ODQsInN1YiI6IjY3NjEyMGZiN2JmMzg2MDUxNTE4OTY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kFOM-0okqtCbnUzRlrWrH-eiTHU0y5RVUXxbIy8KRRs';

  Future<List<MovieModel>> fetchTopRatedMovies() async {
    final response = await http
        .get(Uri.parse('$baseUrl/top_rated?language=en-US&page=1'), headers: {
      'Authorization': 'Bearer $bearerToken',
      'accept': 'application/json'
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['results'] as List);
      return ((jsonDecode(response.body)['results']) as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies data');
    }
  }
}
