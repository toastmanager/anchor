import 'package:anchor/core/components/avatar.dart';
import 'package:anchor/core/components/expanded_horizontal.dart';
import 'package:anchor/features/personal_profile/domain/bloc/personal_profile_bloc.dart';
import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';
import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

@RoutePage()
class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({super.key});

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController birthDateController;
  String? avatarUrl;
  bool isEditingMode = false;

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    birthDateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  void updateProfileData(PersonalProfileEntity entity) {
    fullNameController.text = entity.fullName;
    emailController.text = entity.email;
    birthDateController.text = entity.birthDate.toString().split(' ').first;
    avatarUrl = entity.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => sl<PersonalProfileBloc>(),
          child: Builder(builder: (context) {
            final bloc = context.read<PersonalProfileBloc>();
            bloc.add(PersonalProfileGet());
            return BlocConsumer<PersonalProfileBloc, PersonalProfileState>(
              listener: (context, state) {
                if (state is PersonalProfileUpdateSuccess) {
                  bloc.add(PersonalProfileGet());
                }
              },
              buildWhen: (context, state) {
                return state is! PersonalProfileLoading ||
                    state is! PersonalProfileInitial;
              },
              builder: (context, state) {
                if (state is PersonalProfileLoadFailure) {
                  return const Text('Personal profile load failure');
                }
                if (state is PersonalProfileLoadSuccess) {
                  updateProfileData(state.entity);
                }
                return Form(
                  child: Column(
                    children: [
                      //TODO: Add avatar pick function
                      InkWell(
                          onTap: isEditingMode ? () {} : null,
                          borderRadius: BorderRadius.circular(999),
                          child: Avatar(avatarUrl: avatarUrl)),

                      if (isEditingMode) ...[
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(onPressed: () {}, child: const Text('Reset'))
                      ],

                      const SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                          canRequestFocus: isEditingMode,
                          readOnly: !isEditingMode,
                          controller: fullNameController,
                          onChanged: (value) => bloc.add(
                              PersonalProfileFullNameChange(fullName: value)),
                          decoration:
                              const InputDecoration(label: Text('Full name'))),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                          canRequestFocus: isEditingMode,
                          readOnly: !isEditingMode,
                          controller: emailController,
                          onChanged: (value) => bloc
                              .add(PersonalProfileEmailChange(email: value)),
                          decoration:
                              const InputDecoration(label: Text('Email'))),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                          mouseCursor:
                              !isEditingMode ? null : SystemMouseCursors.click,
                          onTap: !isEditingMode
                              ? null
                              : () async {
                                  await selectBirthDate(bloc);
                                },
                          canRequestFocus: isEditingMode,
                          readOnly: true,
                          controller: birthDateController,
                          decoration: InputDecoration(
                              suffix: isEditingMode
                                  ? const Icon(TablerIcons.calendar)
                                  : null,
                              label: const Text('Birth date'))),
                      const SizedBox(
                        height: 18,
                      ),
                      !isEditingMode
                          ? ExpandedHorizontally(
                              child: FilledButton(
                                  onPressed: () =>
                                      setState(() => isEditingMode = true),
                                  child: const Text('Edit')))
                          : Row(
                              children: [
                                Expanded(
                                    child: FilledButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .secondary)),
                                        onPressed: () => setState(
                                            () => isEditingMode = false),
                                        child: const Text('Cancel'))),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FilledButton(
                                      onPressed: () => setState(() {
                                            isEditingMode = false;
                                            bloc.add(PersonalProfileUpdate());
                                          }),
                                      child: const Text('Apply')),
                                )
                              ],
                            ),
                      const SizedBox(
                        height: 18,
                      ),
                      ExpandedHorizontally(
                        child: FilledButton(
                          onPressed: () => bloc.add(PersonalProfileLogOut()),
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.error)),
                          child: const Text('Log out'),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }

  Future<void> selectBirthDate(PersonalProfileBloc bloc) async {
    final dateNow = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: DateTime(1900),
        lastDate: dateNow);
    if (date != null) {
      bloc.add(PersonalProfileBirthDateChange(birthDate: date));
      birthDateController.text = date.toString().split(' ')[0];
    }
  }
}
