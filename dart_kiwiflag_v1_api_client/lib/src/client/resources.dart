part of kiwiflag_v1_api;

class FlagsapiResource_ {

  final Client _client;

  FlagsapiResource_(Client client) :
      _client = client;

  /**
   *
   * [s]
   *
   * [optParams] - Additional query parameters
   */
  async.Future<FlagsApiStringMessage> flag({core.String s, core.Map optParams}) {
    var url = "flag";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (s != null) queryParams["s"] = s;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new FlagsApiStringMessage.fromJson(data));
  }

  /**
   *
   * [optParams] - Additional query parameters
   */
  async.Future<FlagsApiStringMessage> flagslist({core.Map optParams}) {
    var url = "flags-list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new FlagsApiStringMessage.fromJson(data));
  }

  /**
   *
   * [optParams] - Additional query parameters
   */
  async.Future<FlagsApiStringMessage> uploadurl({core.Map optParams}) {
    var url = "upload-url";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new FlagsApiStringMessage.fromJson(data));
  }
}

