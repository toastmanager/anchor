import 'package:anchor/features/events/domain/entities/event_entity.dart';
import 'package:anchor/features/events/domain/usecases/get_completed_events.dart';
import 'package:anchor/features/events/domain/usecases/get_selected_events.dart';
import 'package:anchor/features/events/domain/usecases/get_upcoming_events.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'events_event.dart';
part 'events_state.dart';

@injectable
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetCompletedEvents getCompletedEvents;
  final GetUpcomingEvents getUpcomingEvents;
  final GetSelectedEvents getSelectedEvents;

  EventsBloc({
    required this.getCompletedEvents,
    required this.getSelectedEvents,
    required this.getUpcomingEvents,
  }) : super(EventsInitial()) {
    on<EventsUpcomingLoad>(_onUpcomingLoad);
    on<EventsSelectedLoad>(_onSelectedLoad);
    on<EventsCompletedLoad>(_onCompletedLoad);
  }

  Future<void> _onUpcomingLoad(
      EventsUpcomingLoad event, Emitter<EventsState> emit) async {
    try {
      emit(EventsUpcomingLoading());
      final events = await getUpcomingEvents.execute();
      emit(EventsUpcomingLoadSuccess(events: events));
    } catch (e) {
      emit(const EventsUpcomingLoadFailure(
          message: 'Failed to load upcoming events'));
      rethrow;
    }
  }

  Future<void> _onSelectedLoad(
      EventsSelectedLoad event, Emitter<EventsState> emit) async {
    try {
      emit(EventsSelectedLoading());
      final events = await getSelectedEvents.execute();
      emit(EventsSelectedLoadSuccess(events: events));
    } catch (e) {
      emit(const EventsSelectedLoadFailure(
          message: 'Failed to load upcoming events'));
      rethrow;
    }
  }

  Future<void> _onCompletedLoad(
      EventsCompletedLoad event, Emitter<EventsState> emit) async {
    try {
      emit(EventsCompletedLoading());
      final events = await getCompletedEvents.execute();
      emit(EventsCompletedLoadSuccess(events: events));
    } catch (e) {
      emit(const EventsCompletedLoadFailure(
          message: 'Failed to load completed events'));
      rethrow;
    }
  }
}
