import 'dart:convert';

import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:http/http.dart' as http;

class ShowApiService {
  static const String _baseUrl = 'https://api.tvmaze.com/shows';

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
