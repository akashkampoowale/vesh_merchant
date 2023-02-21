
class Success extends UIState {

  final data;
  Success({ this.data });

}

class Fail extends UIState {
  final String failCause;
  Fail({required this.failCause});

}

class Error extends UIState {
  final Exception exception;

  Error(this.exception);
}

class Progress extends UIState {}

class Default extends UIState {}



class UIState<T>{}