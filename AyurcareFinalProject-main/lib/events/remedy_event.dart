// counter_event.dart
abstract class RemedyEvent {}

class AddRemedy extends RemedyEvent {
  final String name;

  AddRemedy(this.name);
}
