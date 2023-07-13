import 'package:equatable/equatable.dart';

import '../../data_layer/models/adventures.dart';

/// Represents the state of [AdventureCubit]
class AdventureState extends Equatable {
  /// True if the cubit is processing something.
  final bool busy;

  /// Feed of adventures
  final Feed? feed;

  /// Error message for the last occurred error
  final AdventureStateErrors error;

  /// Creates a new instance of [AdventureState]
  const AdventureState({
    this.busy = false,
    this.feed,
    this.error = AdventureStateErrors.none,
  });

  @override
  List<Object?> get props => [
        busy,
        feed,
        error,
      ];

  /// Creates a new instance of [AdventureState] based on the current instance
  AdventureState copyWith({
    bool? busy,
    Feed? feed,
    AdventureStateErrors? error,
  }) {
    return AdventureState(
      busy: busy ?? this.busy,
      feed: feed ?? this.feed,
      error: error ?? this.error,
    );
  }
}

/// Enum for all possible errors for [AdventureCubit]
enum AdventureStateErrors {
  /// No errors
  none,

  /// Generic error
  generic,
}
