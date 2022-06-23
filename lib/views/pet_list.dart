import 'package:carteira_pet/models/pet.dart';
import 'package:carteira_pet/routes/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:carteira_pet/components/pet_tile.dart';
import 'package:carteira_pet/provider/pets.dart';
import 'package:provider/provider.dart';

class PetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pets pets = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Animais'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PETFORM,
                    arguments:
                        const Pet(id: '', name: '', age: '', imageUrl: ''));
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: pets.count,
          itemBuilder: (ctx, index) => PetTile(pets.byIndex(index)),
        ));
  }
}
