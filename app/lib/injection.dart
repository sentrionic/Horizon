import 'package:get_it/get_it.dart';
import 'package:horizon/injection.config.dart';
import 'package:injectable/injectable.dart';

/// The Singleton instance of GetIt
final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async =>
    getIt.init(environment: env);
