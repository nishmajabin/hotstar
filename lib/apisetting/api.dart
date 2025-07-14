import 'dart:convert';
import 'package:hotstar_clone/apisetting/constant.dart';
import 'package:hotstar_clone/models/movies.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
late String endPoint;

class ApiCalling {
  // fetching trending movies:
  static const String _trendingUrl =
      '${baseUrl}trending/movie/day?api_key=${AppApi.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse(_trendingUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodeData = jsonDecode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
          'Failed to fetch movies! Status: ${response.statusCode}',
        );
      }
    } catch (error) {
      await Future.delayed(Duration(seconds: 2)); // Wait 2 seconds
      return getTrendingMovies();
    }
  }

  // Fetching latest or now playing movies:
  static const String _latestUrl =
      '${baseUrl}movie/now_playing?api_key=${AppApi.apiKey}';

  Future<List<Movie>> getLatestMovies() async {
    try {
      final response = await http.get(Uri.parse(_latestUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodeData = jsonDecode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
          'Failed to fetch movies! Status: ${response.statusCode}',
        );
      }
    } catch (error) {
      await Future.delayed(Duration(seconds: 2)); // Wait 2 seconds
      return getLatestMovies();
    }
  }

  // Fetching Popular movies:
  static const String _popularUrl =
      '${baseUrl}movie/popular?api_key=${AppApi.apiKey}';

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await http.get(Uri.parse(_popularUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodeData = jsonDecode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
          'Failed to fetch Movies! Status: ${response.statusCode}',
        );
      }
    } catch (error) {
      await Future.delayed(Duration(seconds: 2));
      return getPopularMovies();
    }
  }

  // Fetching coming soon movies:
  static const String _comingSoonUrl =
      '${baseUrl}movie/upcoming?api_key=${AppApi.apiKey}';

  Future<List<Movie>> getComingSoonMovies() async {
    try {
      final response = await http.get(Uri.parse(_comingSoonUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodeData = jsonDecode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
          'Failed to fetch Movies! Status: ${response.statusCode}',
        );
      }
    } catch (error) {
      await Future.delayed(Duration(seconds: 2)); // Wait 2 seconds
      return getComingSoonMovies();
    }
  }

  // Fetching Top Rated Movies:
  static const String _topRatedUrl =
      '${baseUrl}movie/top_rated?api_key=${AppApi.apiKey}';

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse(_topRatedUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodeData = jsonDecode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
          'Failed to fetch Movies! Status: ${response.statusCode}',
        );
      }
    } catch (error) {
      await Future.delayed(Duration(seconds: 2)); // Wait 2 seconds
      return getTopRatedMovies();
    }
  }
}
