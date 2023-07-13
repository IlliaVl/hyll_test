import 'package:flutter/material.dart';

import 'data_layer/providers/hyll_provider.dart';
import 'data_layer/repositories/hyll_repository.dart';
import 'my_app.dart';

void main() {
  runApp(
    MyApp(
      adventuresRepository: HyllRepository(
        HyllProvider(),
      ),
    ),
  );
}
