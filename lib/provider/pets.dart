import 'dart:math';

import 'package:carteira_pet/data/pets.dart';
import 'package:flutter/material.dart';
import '../models/pet.dart';

class Pets with ChangeNotifier {
  final Map<String, Pet> _items = {...pets};

  List<Pet> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Pet byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Pet pet) {
    if (pet == null) return;

    if (pet.id != null &&
        pet.id.trim().isNotEmpty &&
        _items.containsKey(pet.id)) {
      _items.update(pet.id, (_) => pet);
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => Pet(
                id: id,
                name: pet.name,
                age: pet.age,
                imageUrl: pet.imageUrl,
              ));
    }

    // houve mudança na lista, então a interface gráfica deve ser notificada
    notifyListeners();
  }

  void remove(Pet pet) {
    if (pet != null && pet.id != null) {
      _items.remove(pet.id);
      notifyListeners();
    }
  }
}
