
import 'package:flutter/material.dart';
import 'package:pto2/models/character_model.dart';
import 'package:pto2/screens/home_screen.dart';

class AbilityDescriptionWidget extends StatelessWidget {
  const AbilityDescriptionWidget({
    super.key,
    required this.ability,
    required this.widget,
  });

  final Ability ability;
  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Descripción: ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(ability.description!),
      ]
    );
  }
}