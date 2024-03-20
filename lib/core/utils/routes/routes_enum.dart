enum Routes {
  splash('/splash'),
  onBoarding('/onBoarding'),
  otp('/'),
  faq('/faq'),
  login('/login'),
  ;

  const Routes(this.path);
  final String path;
}
