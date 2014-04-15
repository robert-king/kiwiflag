part of flags_v1_api;

class FlagsApiStringMessage {

  core.String s;

  /** Create new FlagsApiStringMessage from JSON data */
  FlagsApiStringMessage.fromJson(core.Map json) {
    if (json.containsKey("s")) {
      s = json["s"];
    }
  }

  /** Create JSON Object for FlagsApiStringMessage */
  core.Map toJson() {
    var output = new core.Map();

    if (s != null) {
      output["s"] = s;
    }

    return output;
  }

  /** Return String representation of FlagsApiStringMessage */
  core.String toString() => JSON.encode(this.toJson());

}

class ModelsFlagListMessage {

  core.List<ModelsFlagMessage> items;

  /** Create new ModelsFlagListMessage from JSON data */
  ModelsFlagListMessage.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new ModelsFlagMessage.fromJson(itemsItem)).toList();
    }
  }

  /** Create JSON Object for ModelsFlagListMessage */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of ModelsFlagListMessage */
  core.String toString() => JSON.encode(this.toJson());

}

class ModelsFlagMessage {

  core.String author_fb;

  core.String author_g_plus;

  core.List<core.String> author_links;

  core.String author_location;

  core.String author_name;

  core.String author_twitter;

  core.String datetime;

  core.int down_votes;

  core.String img_link;

  core.int up_votes;

  /** Create new ModelsFlagMessage from JSON data */
  ModelsFlagMessage.fromJson(core.Map json) {
    if (json.containsKey("author_fb")) {
      author_fb = json["author_fb"];
    }
    if (json.containsKey("author_g_plus")) {
      author_g_plus = json["author_g_plus"];
    }
    if (json.containsKey("author_links")) {
      author_links = json["author_links"].toList();
    }
    if (json.containsKey("author_location")) {
      author_location = json["author_location"];
    }
    if (json.containsKey("author_name")) {
      author_name = json["author_name"];
    }
    if (json.containsKey("author_twitter")) {
      author_twitter = json["author_twitter"];
    }
    if (json.containsKey("datetime")) {
      datetime = json["datetime"];
    }
    if (json.containsKey("down_votes")) {
      down_votes = (json["down_votes"] is core.String) ? core.int.parse(json["down_votes"]) : json["down_votes"];
    }
    if (json.containsKey("img_link")) {
      img_link = json["img_link"];
    }
    if (json.containsKey("up_votes")) {
      up_votes = (json["up_votes"] is core.String) ? core.int.parse(json["up_votes"]) : json["up_votes"];
    }
  }

  /** Create JSON Object for ModelsFlagMessage */
  core.Map toJson() {
    var output = new core.Map();

    if (author_fb != null) {
      output["author_fb"] = author_fb;
    }
    if (author_g_plus != null) {
      output["author_g_plus"] = author_g_plus;
    }
    if (author_links != null) {
      output["author_links"] = author_links.toList();
    }
    if (author_location != null) {
      output["author_location"] = author_location;
    }
    if (author_name != null) {
      output["author_name"] = author_name;
    }
    if (author_twitter != null) {
      output["author_twitter"] = author_twitter;
    }
    if (datetime != null) {
      output["datetime"] = datetime;
    }
    if (down_votes != null) {
      output["down_votes"] = down_votes;
    }
    if (img_link != null) {
      output["img_link"] = img_link;
    }
    if (up_votes != null) {
      output["up_votes"] = up_votes;
    }

    return output;
  }

  /** Return String representation of ModelsFlagMessage */
  core.String toString() => JSON.encode(this.toJson());

}

core.Map _mapMap(core.Map source, [core.Object convert(core.Object source) = null]) {
  assert(source != null);
  var result = new dart_collection.LinkedHashMap();
  source.forEach((core.String key, value) {
    assert(key != null);
    if(convert == null) {
      result[key] = value;
    } else {
      result[key] = convert(value);
    }
  });
  return result;
}
