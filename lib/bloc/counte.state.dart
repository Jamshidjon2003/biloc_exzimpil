part of 'counter.bloc.dart';

class CounterState {
  final String name;

  const CounterState(this.name);

  CounterState copyWith({String? name}) => CounterState(name ?? this.name);
}
