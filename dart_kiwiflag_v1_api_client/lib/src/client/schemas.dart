part of kiwiflag_v1_api;

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
