import 'package:carteira_pet/models/pet.dart';
import 'package:carteira_pet/provider/pets.dart';
import 'package:carteira_pet/routes/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetTile extends StatelessWidget {
  final Pet pet;
  const PetTile(this.pet);

  @override
  Widget build(BuildContext context) {
    final avatar = pet.imageUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(pet.imageUrl));
    return ListTile(
      leading: avatar,
      title: Text(pet.name),
      subtitle: Text('${pet.age} ano(s)'),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PETFORM,
                  arguments: pet,
                );
              },
              icon: const Icon(Icons.edit),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Excluir Animal'),
                          content: const Text('Tem certeza?'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Não')),
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('Sim'))
                          ],
                        )).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Pets>(context, listen: false).remove(pet);
                  }
                });
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
