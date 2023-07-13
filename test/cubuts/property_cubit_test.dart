import 'package:bloc_test/bloc_test.dart';
import 'package:untitled/business_layer/cubits/adventures_cubit.dart';
import 'package:untitled/business_layer/cubits/adventures_state.dart';
import 'package:untitled/data_layer/models/adventures.dart';
import 'package:untitled/data_layer/repositories/adventure_repository_interface.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAuditRepository extends Mock
    implements AdventureRepositoryInterface {}

void main() {
  late MockAuditRepository repository;
  late Feed feed;
  const total = 100;

  setUpAll(() {
    final adventuresList = <Adventure>[];
    for (var i = 0; i < total; i++) {
      adventuresList.add(
        Adventure(id: i),
      );
    }
    feed = Feed(
      count: total,
      adventures: adventuresList,
    );

    repository = MockAuditRepository();

    when(
      () => repository.getFeed(),
    ).thenAnswer(
      (_) async => feed,
    );
  });

  blocTest<AdventuresCubit, AdventureState>(
    'Starts on empty state',
    build: () => AdventuresCubit(repository: repository),
    verify: (c) => expect(
      c.state,
      const AdventureState(),
    ),
  );

  blocTest<AdventuresCubit, AdventureState>(
    'Should load adventures',
    build: () => AdventuresCubit(repository: repository),
    act: (c) => c.getAdventures(),
    expect: () => [
      const AdventureState(
        busy: true,
        error: AdventureStateErrors.none,
      ),
      AdventureState(
        feed: feed,
        busy: false,
        error: AdventureStateErrors.none,
      ),
    ],
    verify: (c) => verify(
      () => repository.getFeed(),
    ).called(1),
  );
}
