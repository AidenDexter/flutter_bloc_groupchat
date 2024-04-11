import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_groupchat/pages/profile/settings/bloc/settings_state.dart';

import 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvent event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}
