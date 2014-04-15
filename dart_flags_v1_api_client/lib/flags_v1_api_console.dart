library flags_v1_api.console;

import "package:google_oauth2_client/google_oauth2_console.dart" as oauth2;

import 'package:google_flags_v1_api/src/console_client.dart';

import "package:google_flags_v1_api/flags_v1_api_client.dart";

/** This is an API */
class Flags extends Client with ConsoleClient {

  /** OAuth Scope2: View your email address */
  static const String USERINFO_EMAIL_SCOPE = "https://www.googleapis.com/auth/userinfo.email";

  final oauth2.OAuth2Console auth;

  Flags([oauth2.OAuth2Console this.auth]);
}
