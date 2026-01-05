import 'package:basketball_dashborad_app/cubits/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CountersResetState());

  int teamAPoints = 0;
  int teamBPoints = 0;

  void teamIncreament({required String team, required int buttonNumber}) {
    if (team == 'A') {
      teamAPoints += buttonNumber;
      emit(CounterAState());
    } else {
      teamBPoints += buttonNumber;
      emit(CounterBState());
    }
  }

  void resetCounter() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(CountersResetState());
  }
}
