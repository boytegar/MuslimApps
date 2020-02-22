class MosquePlace {

    List<Result> results;
    String status;

    MosquePlace({ this.results, this.status});

    factory MosquePlace.fromJson(Map<String, dynamic> json) {
        return MosquePlace(

            results: json['results'] != null ? (json['results'] as List).map((i) => Result.fromJson(i)).toList() : null,
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;

        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Result {
    Geometry geometry;
    String icon;
    String id;
    String name;
    OpeningHours opening_hours;
    List<Photo> photos;
    String place_id;
    PlusCode plus_code;
    var rating;
    String reference;
    String scope;
    List<String> types;
    int user_ratings_total;
    String vicinity;

    Result({this.geometry, this.icon, this.id, this.name, this.opening_hours, this.photos, this.place_id, this.plus_code, this.rating, this.reference, this.scope, this.types, this.user_ratings_total, this.vicinity});

    factory Result.fromJson(Map<String, dynamic> json) {
        return Result(
            geometry: json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null,
            icon: json['icon'],
            id: json['id'],
            name: json['name'],
            opening_hours: json['opening_hours'] != null ? OpeningHours.fromJson(json['opening_hours']) : null,
            photos: json['photos'] != null ? (json['photos'] as List).map((i) => Photo.fromJson(i)).toList() : null,
            place_id: json['place_id'],
            plus_code: json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null,
            rating: json['rating'],
            reference: json['reference'],
            scope: json['scope'],
            types: json['types'] != null ? new List<String>.from(json['types']) : null,
            user_ratings_total: json['user_ratings_total'],
            vicinity: json['vicinity'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['icon'] = this.icon;
        data['id'] = this.id;
        data['name'] = this.name;
        data['place_id'] = this.place_id;
        data['rating'] = this.rating;
        data['reference'] = this.reference;
        data['scope'] = this.scope;
        data['user_ratings_total'] = this.user_ratings_total;
        data['vicinity'] = this.vicinity;
        if (this.geometry != null) {
            data['geometry'] = this.geometry.toJson();
        }
        if (this.opening_hours != null) {
            data['opening_hours'] = this.opening_hours.toJson();
        }
        if (this.photos != null) {
            data['photos'] = this.photos.map((v) => v.toJson()).toList();
        }
        if (this.plus_code != null) {
            data['plus_code'] = this.plus_code.toJson();
        }
        if (this.types != null) {
            data['types'] = this.types;
        }
        return data;
    }
}

class PlusCode {
    String compound_code;
    String global_code;

    PlusCode({this.compound_code, this.global_code});

    factory PlusCode.fromJson(Map<String, dynamic> json) {
        return PlusCode(
            compound_code: json['compound_code'],
            global_code: json['global_code'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['compound_code'] = this.compound_code;
        data['global_code'] = this.global_code;
        return data;
    }
}

class OpeningHours {
    bool open_now;

    OpeningHours({this.open_now});

    factory OpeningHours.fromJson(Map<String, dynamic> json) {
        return OpeningHours(
            open_now: json['open_now'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['open_now'] = this.open_now;
        return data;
    }
}

class Geometry {
    Location location;
    Viewport viewport;

    Geometry({this.location, this.viewport});

    factory Geometry.fromJson(Map<String, dynamic> json) {
        return Geometry(
            location: json['location'] != null ? Location.fromJson(json['location']) : null,
            viewport: json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.location != null) {
            data['location'] = this.location.toJson();
        }
        if (this.viewport != null) {
            data['viewport'] = this.viewport.toJson();
        }
        return data;
    }
}

class Location {
    double lat;
    double lng;

    Location({this.lat, this.lng});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            lat: json['lat'],
            lng: json['lng'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        return data;
    }
}

class Viewport {
    Northeast northeast;
    Southwest southwest;

    Viewport({this.northeast, this.southwest});

    factory Viewport.fromJson(Map<String, dynamic> json) {
        return Viewport(
            northeast: json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null,
            southwest: json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.northeast != null) {
            data['northeast'] = this.northeast.toJson();
        }
        if (this.southwest != null) {
            data['southwest'] = this.southwest.toJson();
        }
        return data;
    }
}

class Southwest {
    double lat;
    double lng;

    Southwest({this.lat, this.lng});

    factory Southwest.fromJson(Map<String, dynamic> json) {
        return Southwest(
            lat: json['lat'],
            lng: json['lng'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        return data;
    }
}

class Northeast {
    double lat;
    double lng;

    Northeast({this.lat, this.lng});

    factory Northeast.fromJson(Map<String, dynamic> json) {
        return Northeast(
            lat: json['lat'],
            lng: json['lng'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        return data;
    }
}

class Photo {
    int height;
    List<String> html_attributions;
    String photo_reference;
    int width;

    Photo({this.height, this.html_attributions, this.photo_reference, this.width});

    factory Photo.fromJson(Map<String, dynamic> json) {
        return Photo(
            height: json['height'],
            html_attributions: json['html_attributions'] != null ? new List<String>.from(json['html_attributions']) : null,
            photo_reference: json['photo_reference'],
            width: json['width'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['height'] = this.height;
        data['photo_reference'] = this.photo_reference;
        data['width'] = this.width;
        if (this.html_attributions != null) {
            data['html_attributions'] = this.html_attributions;
        }
        return data;
    }
}