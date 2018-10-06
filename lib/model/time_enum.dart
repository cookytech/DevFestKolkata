enum TimeEnum { beforeEvent, duringEvent, afterEvent }

final DateTime _eventDay = DateTime(2018, 11, 4);
TimeEnum get currentTimeType {
  DateTime _currentDay = DateTime.now();
  return _currentDay.isBefore(_eventDay)
      ? TimeEnum.beforeEvent
      : _currentDay.isAfter(_eventDay)
          ? TimeEnum.afterEvent
          : TimeEnum.duringEvent;
}