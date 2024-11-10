import 'package:flutter/material.dart';

class Event {
  final String description;
  final DateTime date;

  Event({required this.description, required this.date});
}

class EventModel extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => List.unmodifiable(_events);

  void addEvent(String description, DateTime date) {
    _events.add(Event(description: description, date: date));
    notifyListeners();
  }

  void removeEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }
}
