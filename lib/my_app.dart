import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/business_layer/cubits/adventures_cubit.dart';

// import 'business_layer/cubits/adventures_cubit.dart';
import 'data_layer/repositories/adventure_repository_interface.dart';
import 'presentation_layer/adventures_screen.dart';

/// The application widget
class MyApp extends StatelessWidget {
  /// Creates the [MyApp]
  const MyApp({
    Key? key,
    required this.adventuresRepository,
  }) : super(key: key);

  /// The repository responsible for user roles.
  final AdventureRepositoryInterface adventuresRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AdventuresCubit>(
        create: (context) => AdventuresCubit(
          repository: adventuresRepository,
        )..getAdventures(),
        child: const AdventuresScreen(),
      ),
    );
  }
}
