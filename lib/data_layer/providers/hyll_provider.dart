import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/adventures.dart';
import '../models/adventures_error.dart';

/// Provides data related to adventure objects from HYLL API.
class HyllProvider {
  static const _baseUrl = 'api.hyll.com';
  final http.Client _httpClient;

  /// Creates new [HyllProvider].
  HyllProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Uri _getUrl(
    String path, {
    Map<String, dynamic>? parameters,
  }) =>
      Uri.https(
        _baseUrl,
        path,
        {
          ...?parameters,
        },
      );

  /// Returns [Feed]
  Future<Feed> getAdventures() async {
    final response = await _httpClient.get(
      _getUrl('/api/adventures/'),
    );
    if (response.statusCode != 200) {
      throw const AdventureException(
        AdventureExceptionType.network,
      );
    }
    try {
      final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;
      final feed = Feed.fromJson(bodyJson);
      return feed;
    } catch (_) {
      throw const AdventureException(
        AdventureExceptionType.parsing,
      );
    }
  }
}
