import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class AppServices with ChangeNotifier {
  String id;
  Uri baseUrl;
  App _app;
  User? currentUser;
  AppServices(this.id, this.baseUrl)
      : _app = App(AppConfiguration(id, baseUrl: baseUrl));

  Future<User> logInUserEmailPw(String email, String password) async {
    User loggedInUser =
        await _app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  Future<User> registerUserEmailPw(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(_app);
    await authProvider.registerUser(email, password);
    User loggedInUser =
        await _app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  Future<void> logOutUser() async {
    await _app.currentUser?.logOut();
    currentUser = null;
    notifyListeners();
  }
}
