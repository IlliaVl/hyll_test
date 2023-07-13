/// Thrown if during fetching adventures process failure occurs.
class AdventureException implements Exception {
  /// Type of error.
  final AdventureExceptionType errorType;

  /// The associated error message.
  final String message;

  /// Creates [AdventureException].
  const AdventureException(
    this.errorType, [
    this.message = 'An unknown exception occurred.',
  ]);
}

/// Types of [AdventureException]s.
enum AdventureExceptionType {
  /// If error occurs at parsing stage.
  parsing,

  /// If error occurs at performing request stage.
  network
}
