import '../models/adventures.dart';
import '../providers/hyll_provider.dart';
import 'adventure_repository_interface.dart';

/// Handles all the adventures data
class HyllRepository implements AdventureRepositoryInterface {
  final HyllProvider _hyllProvider;

  /// Creates a new [HyllRepository] instance
  HyllRepository(this._hyllProvider);

  /// Retrieves the feed of adventures.
  @override
  Future<Feed> getFeed() => _hyllProvider.getAdventures();
}
