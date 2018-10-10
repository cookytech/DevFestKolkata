import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:devfest_18_kolkata/model/session.dart';

List<Session> mobileTrack = List.generate(8, (_) => Session.dummy());
List<Session> cloudTrack = List.generate(6, (_) => Session.dummy());

bool _isSelectorVisibleCache = false;
BehaviorSubject<bool> _isSelectorVisible = BehaviorSubject<bool>();
Stream<bool> get isSelectorVisibleStream => _isSelectorVisible.stream;
StreamSink<bool> get _isSelectorVisibleSink => _isSelectorVisible.sink;

Session _currentDisplayedSessionCache = Session.dummy();
BehaviorSubject<Session> _currentSessionController = BehaviorSubject<Session>();
Stream<Session> get currentSessionStream => _currentSessionController.stream;
StreamSink<Session> get _currentSessionSink => _currentSessionController.sink;

makeVisible() {
  _isSelectorVisibleCache = true;
  _isSelectorVisibleSink.add(_isSelectorVisibleCache);
}

makeInvisible() {
  _isSelectorVisibleCache = false;
  _isSelectorVisibleSink.add(_isSelectorVisibleCache);
}
