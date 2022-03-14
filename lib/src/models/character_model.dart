// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  CharacterModel({
    required this.info,
    required this.results,
  });

  // CharacterModel.fromJson(Map<String, dynamic> json) {
  //   info = (json['info'] != null ? Info.fromJson(json['info']) : null)!;
  //   if (json['results'] != null) {
  //     results = <Result>[];
  //     json['results'].forEach((dynamic v) {
  //       results.add(Result.fromJson(v));
  //     });
  //   }
  // }

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        info: Info.fromJson(json['info']),
        results: List<Result>.from(json['results'].map(Result.fromJson)),
      );

  static CharacterModel decoderFromJson(dynamic json) =>
      CharacterModel.fromJson(json);

  Info info;
  List<Result> results;

  Map<String, dynamic> toJson() => {
        'info': info.toJson(),
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json['count'],
        pages: json['pages'],
        next: json['next'],
        prev: json['prev'],
      );

  int count;
  int pages;
  String next;
  dynamic prev;

  Map<String, dynamic> toJson() => {
        'count': count,
        'pages': pages,
        'next': next,
        'prev': prev,
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Result.fromJson(dynamic json) => Result(
        id: json['id'],
        name: json['name'],
        status: statusValues.map[json['status']],
        species: speciesValues.map[json['species']],
        type: json['type'],
        gender: genderValues.map[json['gender']],
        origin: Location.fromJson(json['origin']),
        location: Location.fromJson(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode'].map((dynamic x) => x)),
        url: json['url'],
        created: DateTime.parse(json['created']),
      );

  int id;
  String name;
  Status? status;
  Species? species;
  String type;
  Gender? gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': statusValues.reverse[status],
        'species': speciesValues.reverse[species],
        'type': type,
        'gender': genderValues.reverse[gender],
        'origin': origin.toJson(),
        'location': location.toJson(),
        'image': image,
        'episode': List<dynamic>.from(episode.map((x) => x)),
        'url': url,
        'created': created.toIso8601String(),
      };
}

enum Gender {
  male,
  female,
  unknown,
}

final genderValues = EnumValues({
  'Female': Gender.female,
  'Male': Gender.male,
  'unknown': Gender.unknown,
});

class Location {
  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'],
        url: json['url'],
      );

  String name;
  String url;

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

enum Species {
  human,
  alien,
}

final speciesValues = EnumValues({
  'Alien': Species.alien,
  'Human': Species.human,
});

enum Status {
  alive,
  unknown,
  dead,
}

final statusValues = EnumValues({
  'Alive': Status.alive,
  'Dead': Status.dead,
  'unknown': Status.unknown,
});

class EnumValues<T> {
  EnumValues(this.map);

  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    return reverseMap;
  }
}
