library kiwiflag_v1_api.browser;

import "package:google_oauth2_client/google_oauth2_browser.dart" as oauth;

import 'package:google_kiwiflag_v1_api/src/browser_client.dart';
import "package:google_kiwiflag_v1_api/kiwiflag_v1_api_client.dart";

/** This is an API */
class Kiwiflag extends Client with BrowserClient {

  /** OAuth Scope2: View your email address */
  static const String USERINFO_EMAIL_SCOPE = "https://www.googleapis.com/auth/userinfo.email";

  final oauth.OAuth2 auth;

  Kiwiflag([oauth.OAuth2 this.auth]);
}