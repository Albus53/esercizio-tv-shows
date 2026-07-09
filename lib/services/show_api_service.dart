import 'dart:convert';

import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:http/http.dart' as http;

class ShowApiService {
  static const String _baseUrl = 'https://api.tvmaze.com/shows';

  // Review note:
  // The service currently uses a simple error handling strategy:
  // every response different from 200 throws the same generic exception.
  //
  // A possible improvement would be to handle different cases separately,
  // such as server errors, network failures, timeouts or invalid JSON responses,
  // so the provider could show a clearer message to the user.
  Future<List<ShowModel>> fetchShows() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return ShowModel.listFromJson(jsonList);
    } else {
      throw Exception('Error: unable to load shows');
    }
  }
}
