import 'package:carteira_pet/provider/pets.dart';
import 'package:carteira_pet/routes/appRoutes.dart';
import 'package:carteira_pet/views/pet_list.dart';
import 'package:carteira_pet/views/pet_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Pets())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => PetList(),
          AppRoutes.PETFORM: (_) => PetForm(),
        },
      ),
    );
  }
}
