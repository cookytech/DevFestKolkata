import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:devfest_18_kolkata/model/session.dart';

//LeftSelectorVisibility
bool _isLeftSelectorVisibleCache = false;
BehaviorSubject<bool> _isLeftSelectorVisibleController =
    BehaviorSubject<bool>();
Stream<bool> get isLeftSelectorVisibleStream =>
    _isLeftSelectorVisibleController.stream;
set _isLeftSelectorVisible(bool isVisible) {
  _isLeftSelectorVisibleCache = isVisible;
  _isLeftSelectorVisibleController.sink.add(_isLeftSelectorVisibleCache);
}

//Right Selector Visibility
bool _isRightSelectorVisibleCache = false;
BehaviorSubject<bool> _isRightSelectorVisibleController =
    BehaviorSubject<bool>();
Stream<bool> get isRightSelectorVisibleStream =>
    _isRightSelectorVisibleController.stream;
set _isRightSelectorVisible(bool isVisible) {
  _isRightSelectorVisibleCache = isVisible;
  _isRightSelectorVisibleController.sink.add(_isRightSelectorVisibleCache);
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
Session _currentDisplayedSessionCache = Session.dummy();
BehaviorSubject<Session> _currentSessionController = BehaviorSubject<Session>();
Stream<Session> get currentSessionStream => _currentSessionController.stream;
set currentSession(Session session) {
  _currentDisplayedSessionCache = session;
  _currentSessionController.sink.add(session);
}

makeRightSelectorVisible() {
  _isBackdropVisible = true;
  _isRightSelectorVisible = true;
}

makeLeftSelectorVisible() {
  _isBackdropVisible = true;
  _isLeftSelectorVisible = true;
}

makeInvisible() {
  _isBackdropVisible = false;
  _isLeftSelectorVisible = false;
  _isRightSelectorVisible = false;
}
