part of 'counter.bloc.dart';

abstract class CounterEvent {}

class UpdateNameEvent extends CounterEvent {
  final String name;

  UpdateNameEvent(this.name);
}
