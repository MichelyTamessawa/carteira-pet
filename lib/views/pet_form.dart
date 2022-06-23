import 'package:carteira_pet/models/pet.dart';
import 'package:carteira_pet/provider/pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetForm extends StatefulWidget {
  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Pet pet) {
    _formData['id'] = pet.id;
    _formData['name'] = pet.name;
    _formData['age'] = pet.age.toString();
    _formData['imageUrl'] = pet.imageUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final pet = ModalRoute.of(context)!.settings.arguments as Pet;
    _loadFormData(pet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário do Animal'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                if (_form.currentState!.validate()) {
                  _form.currentState!.save();

                  Provider.of<Pets>(context, listen: false).put(Pet(
                      id: _formData['id'].toString(),
                      name: _formData['name'].toString(),
                      age: _formData['age'].toString(),
                      imageUrl: _formData['imageUrl'].toString()));

                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Adicione o nome do animal';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['age'],
                  decoration: const InputDecoration(labelText: 'Idade'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Adicione a idade do animal';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['age'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['imageUrl'],
                  decoration: const InputDecoration(labelText: 'Url Avatar'),
                  onSaved: (value) => _formData['imageUrl'] = value!,
                )
              ],
            )),
      ),
    );
  }
}
