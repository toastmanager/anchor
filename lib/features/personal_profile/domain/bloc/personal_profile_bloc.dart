import 'package:anchor/features/personal_profile/domain/usecases/get_personal_profile.dart';
import 'package:anchor/features/personal_profile/domain/usecases/log_out.dart';
import 'package:anchor/features/personal_profile/domain/usecases/update_personal_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';

part 'personal_profile_event.dart';
part 'personal_profile_state.dart';

@injectable
class PersonalProfileBloc
    extends Bloc<PersonalProfileEvent, PersonalProfileState> {
  final GetPersonalProfile getPersonalProfile;
  final LogOut logOut;
  final UpdatePersonalProfile updatePersonalProfile;

  PersonalProfileBloc({
    required this.getPersonalProfile,
    required this.logOut,
    required this.updatePersonalProfile,
  }) : super(PersonalProfileInitial()) {
    on<PersonalProfileGet>(_onGet);
    on<PersonalProfileUpdate>(_onUpdate);
    on<PersonalProfileLogOut>(_onLogOut);
    on<PersonalProfileFullNameChange>(_onFullNameChange);
    on<PersonalProfileEmailChange>(_onEmailChange);
    on<PersonalProfileBirthDateChange>(_onBirthDateChange);
  }

  PersonalProfileEntity? profile;

  Future<void> _onGet(
      PersonalProfileGet event, Emitter<PersonalProfileState> emit) async {
    try {
      emit(PersonalProfileLoading());
      final entity = await getPersonalProfile.execute();
      profile = entity;
      emit(PersonalProfileLoadSuccess(entity: entity));
    } catch (e) {
      emit(const PersonalProfileLoadFailure(
          message: 'Failed to get personal profile'));
      rethrow;
    }
  }

  Future<void> _onUpdate(
      PersonalProfileUpdate event, Emitter<PersonalProfileState> emit) async {
    try {
      if (profile == null) {
        emit(const PersonalProfileUpdateFailure(
            message: 'profile variable is null in PersonalProfileBloc'));
      } else {
        emit(PersonalProfileUpdating());
        await updatePersonalProfile.execute(profile!);
        emit(PersonalProfileUpdateSuccess());
      }
    } catch (e) {
      emit(const PersonalProfileUpdateFailure(
          message: 'Failed to get personal profile'));
      rethrow;
    }
  }

  Future<void> _onLogOut(
      PersonalProfileLogOut event, Emitter<PersonalProfileState> emit) async {
    try {
      await logOut.execute();
    } catch (e) {
      emit(const PersonalProfileLoadFailure(message: 'Failed to log out'));
      rethrow;
    }
  }

  Future<void> _onFullNameChange(PersonalProfileFullNameChange event,
      Emitter<PersonalProfileState> emit) async {
    if (profile == null) {
      emit(const PersonalProfileChangeFailure(
          message: 'profile variable is null in PersonalProfileBloc'));
    } else {
      profile = profile!.copyWith(fullName: event.fullName);
    }
  }

  Future<void> _onEmailChange(PersonalProfileEmailChange event,
      Emitter<PersonalProfileState> emit) async {
    if (profile == null) {
      emit(const PersonalProfileChangeFailure(
          message: 'profile variable is null in PersonalProfileBloc'));
    } else {
      profile = profile!.copyWith(email: event.email);
    }
  }

  Future<void> _onBirthDateChange(PersonalProfileBirthDateChange event,
      Emitter<PersonalProfileState> emit) async {
    if (profile == null) {
      emit(const PersonalProfileChangeFailure(
          message: 'profile variable is null in PersonalProfileBloc'));
    } else {
      profile = profile!.copyWith(birthDate: event.birthDate);
    }
  }
}
