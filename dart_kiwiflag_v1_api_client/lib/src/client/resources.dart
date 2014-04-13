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
  async.Future<ModelsFlagMessage> flag({core.String s, core.Map optParams}) {
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
      .then((data) => new ModelsFlagMessage.fromJson(data));
  }

  /**
   *
   * [max_results]
   *   Default: 100
   *
   * [sort_order]
   *   Default: newest
   *   Allowed values:
   *     down_votes - 
   *     newest - 
   *     oldest - 
   *     up_votes - 
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ModelsFlagListMessage> flagslist({core.int max_results, core.String sort_order, core.Map optParams}) {
    var url = "flags-list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (max_results != null) queryParams["max_results"] = max_results;
    if (sort_order != null && !["down_votes", "newest", "oldest", "up_votes"].contains(sort_order)) {
      paramErrors.add("Allowed values for sort_order: down_votes, newest, oldest, up_votes");
    }
    if (sort_order != null) queryParams["sort_order"] = sort_order;
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
      .then((data) => new ModelsFlagListMessage.fromJson(data));
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

