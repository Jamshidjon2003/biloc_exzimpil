import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter.event.dart';

part 'counte.state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState("")) {
    on<UpdateNameEvent>(_onUpdateName);
  }

  void _onUpdateName(
    UpdateNameEvent event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }
}
