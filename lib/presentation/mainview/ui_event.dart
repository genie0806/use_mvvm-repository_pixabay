abstract class UiEvent {
  factory UiEvent.showSnackBar(String message) = Showsnackbar;
}

class Showsnackbar implements UiEvent {
  final String message;
  Showsnackbar(
    this.message,
  );
}
