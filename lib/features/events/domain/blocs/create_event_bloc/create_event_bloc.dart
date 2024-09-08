import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'create_event_event.dart';
part 'create_event_state.dart';

@injectable
class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  CreateEventBloc() : super(CreateEventInitial()) {
    on<CreateEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
