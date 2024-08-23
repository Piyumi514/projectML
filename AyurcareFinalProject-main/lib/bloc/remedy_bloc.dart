import 'package:ayurcare/events/remedy_event.dart';
import 'package:ayurcare/state/remedy_state.dart';
import 'package:bloc/bloc.dart';

class RemedyBloc extends Bloc<RemedyEvent, RemedyState> {
  RemedyBloc() : super(RemedyState("")) {
    on<AddRemedy>((event, emit) {
      emit(RemedyState(event.name));
    });
  }
}
