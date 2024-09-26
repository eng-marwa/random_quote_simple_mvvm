import 'package:flutter/material.dart';

import '../model/random_quote_model.dart';
import '../network/api_service.dart';

class RandomQuoteViewModel extends ChangeNotifier {
  final ApiService _apiService;

  RandomQuoteViewModel(this._apiService);

  RandomQuoteModel? _quote;
  bool _isLoading = false;
  String? _error;

  RandomQuoteModel? get quote => _quote;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRandomQuote() async {
    _isLoading = true;
    notifyListeners();

    try {
      _quote = await _apiService.fetchData();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
