import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/models/adventures_error.dart';
import '../../data_layer/repositories/adventure_repository_interface.dart';
import 'adventures_state.dart';

/// Cubit responsible for retrieving the list of [Adventure].
class AdventuresCubit extends Cubit<AdventureState> {
  final AdventureRepositoryInterface _repository;

  /// Creates a new instance of [AdventuresCubit]
  AdventuresCubit({
    required AdventureRepositoryInterface repository,
  })  : _repository = repository,
        super(const AdventureState());

  /// Loads all Adventures.
  Future<void> getAdventures({
    bool loadMore = false,
  }) async {
    emit(
      state.copyWith(
        busy: true,
        error: AdventureStateErrors.none,
      ),
    );

    try {
      final feed = await _repository.getFeed();

      emit(
        state.copyWith(
          feed: feed,
          busy: false,
          error: AdventureStateErrors.none,
        ),
      );
    } on AdventureException {
      emit(
        state.copyWith(
          busy: true,
          error: AdventureStateErrors.generic,
        ),
      );
    }
  }
}
