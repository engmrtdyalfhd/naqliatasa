import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  NavigatorState get nav => Navigator.of(this);
  FocusScopeNode get scope => FocusScope.of(this);
  MediaQueryData get query => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  ScaffoldMessengerState get toast => ScaffoldMessenger.of(this);
}

extension NavigationExtensions on BuildContext {
  Future<void> popAndPushNamedWithDelay(
    String routeName, {
    Object? arguments,
  }) async {
    Navigator.pop(this);
    await Future.delayed(const Duration(milliseconds: 250));
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      this,
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.popAndPushNamed<T, TO>(
      this,
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.pop<T>(this, result);
  }
}
