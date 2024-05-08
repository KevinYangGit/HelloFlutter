
import 'dart:convert';

import 'package:flutter/material.dart';

int counter = 1;

class Person {
  String name;
  String avatarURL;

  Person(
    this.name,
    this.avatarURL
  );

  Person.fromJson(Map<String, dynamic> json)
        : name = json['name'],
          avatarURL = json['avatarURL'] ?? '';
  }

class Actor extends Person {
  Actor.fromJson(Map<String, dynamic> json): super.fromJson(json);
}

class Director extends Person {
  Director.fromJson(Map<String, dynamic> json): super.fromJson(json);
}

class MovieItem {
  int rank;
  String imageUrl;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  MovieItem({
    required this.rank,
    required this.imageUrl,
    required this.title,
    required this.playDate,
    required this.rating,
    required this.genres,
    required this.casts,
    required this.director,
    required this.originalTitle,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      rank: counter++,
      imageUrl: json['cover']['url'], 
      title: json['title'], 
      playDate: json['year'], 
      rating: json['rating']['value'], 
      genres: (json['actors'] as List<dynamic>).map((e) {
        return '$e';
      }).toList(), 
      casts: (json['actors'] as List<dynamic>).map((e) {
        return Actor.fromJson({'name':e});
      }).toList(),
      director: Director.fromJson({'name': json['directors'][0]}), 
      originalTitle: json['original_title'] ?? '');
  }
}