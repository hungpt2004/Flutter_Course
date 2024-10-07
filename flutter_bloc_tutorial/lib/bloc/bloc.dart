import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/event.dart';
import 'package:flutter_bloc_tutorial/bloc/state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    //Use the method
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  //Method increment
  void _onIncrement(Increment event, Emitter<CounterState> emit) {
    emit(CounterState(state.counterValue + 1));
  }

  //Method decrement
  void _onDecrement(Decrement event, Emitter<CounterState> emit) {
    emit(CounterState(state.counterValue - 1));
  }

}
