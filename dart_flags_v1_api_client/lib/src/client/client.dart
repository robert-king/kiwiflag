part of flags_v1_api;

abstract class Client extends ClientBase {
  core.String basePath = "/_ah/api/flags/v1/";
  core.String rootUrl = "http://127.0.0.1:8080/";


  //
  // Parameters
  //

  /**
   * Data format for the response.
   * Added as queryParameter for each request.
   */
  core.String get alt => params["alt"];
  set alt(core.String value) => params["alt"] = value;

  /**
   * Selector specifying which fields to include in a partial response.
   * Added as queryParameter for each request.
   */
  core.String get fields => params["fields"];
  set fields(core.String value) => params["fields"] = value;

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
   * Added as queryParameter for each request.
   */
  core.String get key => params["key"];
  set key(core.String value) => params["key"] = value;

  /**
   * OAuth 2.0 token for the current user.
   * Added as queryParameter for each request.
   */
  core.String get oauth_token => params["oauth_token"];
  set oauth_token(core.String value) => params["oauth_token"] = value;

  /**
   * Returns response with indentations and line breaks.
   * Added as queryParameter for each request.
   */
  core.bool get prettyPrint => params["prettyPrint"];
  set prettyPrint(core.bool value) => params["prettyPrint"] = value;

  /**
   * Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
   * Added as queryParameter for each request.
   */
  core.String get quotaUser => params["quotaUser"];
  set quotaUser(core.String value) => params["quotaUser"] = value;

  /**
   * IP address of the site where the request originates. Use this if you want to enforce per-user limits.
   * Added as queryParameter for each request.
   */
  core.String get userIp => params["userIp"];
  set userIp(core.String value) => params["userIp"] = value;

  //
  // Methods
  //

  /**
   *
   * [s]
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete_flag({core.String s, core.Map optParams}) {
    var url = "delete_flag";
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
    response = this.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

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
    response = this.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
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
  async.Future<ModelsFlagListMessage> flags({core.int max_results, core.String sort_order, core.Map optParams}) {
    var url = "flags";
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
    response = this.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ModelsFlagListMessage.fromJson(data));
  }

  /**
   *
   * [optParams] - Additional query parameters
   */
  async.Future<FlagsApiStringMessage> upload_url({core.Map optParams}) {
    var url = "upload_url";
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
    response = this.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new FlagsApiStringMessage.fromJson(data));
  }

  /**
   *
   * [voters_id]
   *
   * [flag_urlsafe_id]
   *
   * [vote_type]
   *   Allowed values:
   *     down - 
   *     up - 
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> vote(core.String voters_id, core.String flag_urlsafe_id, core.String vote_type, {core.Map optParams}) {
    var url = "vote";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (flag_urlsafe_id == null) paramErrors.add("flag_urlsafe_id is required");
    if (flag_urlsafe_id != null) queryParams["flag_urlsafe_id"] = flag_urlsafe_id;
    if (vote_type == null) paramErrors.add("vote_type is required");
    if (vote_type != null && !["down", "up"].contains(vote_type)) {
      paramErrors.add("Allowed values for vote_type: down, up");
    }
    if (vote_type != null) queryParams["vote_type"] = vote_type;
    if (voters_id == null) paramErrors.add("voters_id is required");
    if (voters_id != null) queryParams["voters_id"] = voters_id;
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
    response = this.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}
