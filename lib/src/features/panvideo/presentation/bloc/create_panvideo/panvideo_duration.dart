enum PanvideoDuration {
  short,
  medium,
  long;

  Duration get duration => Duration(seconds: durationInSecs);

  int get durationInSecs {
    switch (this) {
      case PanvideoDuration.short:
        return 15;
      case PanvideoDuration.medium:
        return 30;
      case PanvideoDuration.long:
        return 60;
    }
  }
}
