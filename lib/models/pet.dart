import 'package:flutter/material.dart';

class Pet {
  final String id;
  final String name;
  final String age;
  final String imageUrl;

  const Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl,
  });
}
