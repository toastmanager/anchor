part of 'events_bloc.dart';

sealed class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

class EventsUpcomingLoad extends EventsEvent {}

class EventsSelectedLoad extends EventsEvent {}

class EventsCompletedLoad extends EventsEvent {}

class EventsSwitchParticipation extends EventsEvent {
  final int eventId;

  const EventsSwitchParticipation({required this.eventId});
}