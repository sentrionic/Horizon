import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:horizon/infrastructure/proto/artist_service.pbgrpc.dart';
import 'package:horizon/infrastructure/proto/auth_service.pbgrpc.dart';
import 'package:horizon/infrastructure/proto/playlist_service.pbgrpc.dart';
import 'package:horizon/infrastructure/proto/song_service.pbgrpc.dart';
import 'package:injectable/injectable.dart';

/// Module used for injecting singletons and the server urls
@module
abstract class InjectableModule {
  /// The server's base url.
  @Named("BaseUrl")
  String get baseUrl => "192.168.2.148";

  @Named("Port")
  int get port => 8080;

  @Named("Authority")
  String get authority => "localhost";

  @lazySingleton
  @preResolve
  Future<ClientChannel> get channel async {
    final certs = await rootBundle.load("assets/ca-cert.pem");
    return ClientChannel(
      baseUrl,
      port: port,
      options: ChannelOptions(
        credentials: ChannelCredentials.secure(
          certificates: certs.buffer.asUint8List(),
          authority: authority,
        ),
      ),
    );
  }

  @lazySingleton
  SongClient songClient(ClientChannel channel) => SongClient(channel);

  @lazySingleton
  ArtistClient artistClient(ClientChannel channel) => ArtistClient(channel);

  @lazySingleton
  AuthClient authClient(ClientChannel channel) => AuthClient(channel);

  @lazySingleton
  PlaylistClient playlistClient(ClientChannel channel) =>
      PlaylistClient(channel);

  @lazySingleton
  FlutterSecureStorage storage() => const FlutterSecureStorage();
}
