part of 'events_bloc.dart';

sealed class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

final class EventsInitial extends EventsState {}

class EventsUpcomingLoading extends EventsState {}

class EventsUpcomingLoadFailure extends EventsState {
  final String message;

  const EventsUpcomingLoadFailure({required this.message});
}

class EventsUpcomingLoadSuccess extends EventsState {
  final List<EventEntity> events;

  const EventsUpcomingLoadSuccess({required this.events});
}

class EventsSelectedLoading extends EventsState {}

class EventsSelectedLoadFailure extends EventsState {
  final String message;

  const EventsSelectedLoadFailure({required this.message});
}

class EventsSelectedLoadSuccess extends EventsState {
  final List<EventEntity> events;

  const EventsSelectedLoadSuccess({required this.events});
}

class EventsCompletedLoading extends EventsState {}

class EventsCompletedLoadFailure extends EventsState {
  final String message;

  const EventsCompletedLoadFailure({required this.message});
}

class EventsCompletedLoadSuccess extends EventsState {
  final List<EventEntity> events;

  const EventsCompletedLoadSuccess({required this.events});
}
