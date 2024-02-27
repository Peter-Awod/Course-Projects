import 'package:counter_app_stlls_vs_stateful/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCounterCubit extends Cubit<CounterStates> {
  NewCounterCubit() : super(CounterInitialState());

  static NewCounterCubit get(context) {
    return BlocProvider.of(context);
  }

  int counter = 0;

  void decrease() {
    counter--;
    emit(CounterDecreaseState());
  }

  void increase() {
    counter++;
    emit(CounterIncreaseState());
  }

  void reset() {
    counter = 0;
    emit(CounterResetState());
  }
}
