import 'package:flutter/material.dart';

class DirectorsList extends ChangeNotifier {
  DirectorsList({required this.directors});

  // Create a DirectorsList instance from a JSON list
  factory DirectorsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final directors = <Director>[];
      json['data'].forEach((director) {
        directors.add(Director.fromJson(director as Map<String, dynamic>));
      });
      return DirectorsList(directors: directors);
    } else {
      return DirectorsList(directors: []);
    }
  }
  List<Director> directors;

  // Convert a DirectorsList instance to a JSON list
  Map<String, dynamic> toJson() {
    return {
      'data': directors.map((director) => director.toJson()).toList(),
    };
  }

  // Create a copy of the DirectorsList instance
  DirectorsList copyWith({List<Director>? directors}) {
    return DirectorsList(directors: directors ?? this.directors);
  }

  // update a from a JSON list
  void updateFromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final directors = <Director>[];
      json['data'].forEach((director) {
        directors.add(Director.fromJson(director as Map<String, dynamic>));
      });
      this.directors = directors;
    }
    notifyListeners();
  }
}

class Director {
  Director({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.dob,
  });

  // Create a Director instance from a JSON map
  factory Director.fromJson(Map<String, dynamic> json) {
    return Director(
      firstName: json['firstName'] as String? ?? '',
      middleName: json['middleName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
    );
  }
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String dob;

  // Convert a Director instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'dob': dob,
    };
  }

  // Create a copy of the Director instance
  Director copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? gender,
    String? dob,
  }) {
    return Director(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
    );
  }
}
