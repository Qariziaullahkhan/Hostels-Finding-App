import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Add signup logic using Firebase Auth and Firestore
  Future<void> signup(String name, String email, String password) async {
    // Implement sign up logic with error handling
    isLoading = true; // Update loading state before network call
    // ... Firebase Auth and Firestore code
    isLoading = false; // Update loading state after network call
  }
}