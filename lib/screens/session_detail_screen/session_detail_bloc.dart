import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:devfest_18_kolkata/model/session.dart';

//selectorVisibility
bool _isSelectorVisibleCache = false;
BehaviorSubject<bool> _isSelectorVisibleController = BehaviorSubject<bool>();
Stream<bool> get isSelectorVisibleStream => _isSelectorVisibleController.stream;
set _isSelectorVisible(bool isVisible) {
  _isSelectorVisibleCache = isVisible;
  _isSelectorVisibleController.sink.add(_isSelectorVisibleCache);
}

//Backdrop Layer Visibility
bool _isBackdropVisibleCache = false;
BehaviorSubject<bool> _isBackdropVisibleController = BehaviorSubject<bool>();
Stream<bool> get isBackdropVisibleStream => _isBackdropVisibleController.stream;
set _isBackdropVisible(bool isVisible) {
  _isBackdropVisibleCache = isVisible;
  _isBackdropVisibleController.sink.add(_isBackdropVisibleCache);
}

//Current active session Controller
Session _currentDisplayedSessionCache;
BehaviorSubject<Session> _currentSessionController = BehaviorSubject<Session>();
Stream<Session> get currentSessionStream => _currentSessionController.stream;
set currentSession(Session session) {
  _currentDisplayedSessionCache = session;
  _currentSessionController.sink.add(_currentDisplayedSessionCache);
}

makeLeftSelectorVisible() {
  _isBackdropVisible = true;
  _isSelectorVisible = true;
}

makeInvisible() {
  _isBackdropVisible = false;
  _isSelectorVisible = false;
}