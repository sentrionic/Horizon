import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

/// Initializes the hydrated_bloc in a mocked storage.
T mockHydratedStorage<T>(T Function() body, {Storage? storage}) {
  HydratedBloc.storage = storage ?? _buildMockStorage();
  return body();
}

Storage _buildMockStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  return storage;
}
