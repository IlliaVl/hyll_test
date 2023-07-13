import '../models/adventures.dart';

/// Abstract definition for the adventure repository.
abstract class AdventureRepositoryInterface {
  /// Retrieves the feed of adventures.
  Future<Feed> getFeed();
}
