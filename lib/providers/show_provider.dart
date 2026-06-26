import 'package:esercizio_tv_shows/models/show_model.dart';
import 'package:esercizio_tv_shows/services/show_api_service.dart';
import 'package:flutter/material.dart';

class ShowsProvider extends ChangeNotifier {
  final ShowApiService _apiService;

  ShowsProvider(this._apiService);

  List<ShowModel> _shows = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ShowModel> get shows => _shows;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getShows() async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final shows = await _apiService.fetchShows();
      _shows = shows;
    } catch (error) {
      _errorMessage = 'Error loading shows';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
