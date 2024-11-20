import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pto2/models/character_model.dart';
import 'package:pto2/screens/home_screen.dart';
import 'package:pto2/widgets/ability_information_widget.dart';

class CharacterInformationWidget extends StatelessWidget {
  const CharacterInformationWidget({
    super.key,
    required this.characters,
    required this.widget,
  });

  final List<Character> characters;
  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Descripción: ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(characters[widget.index].description!),
        const SizedBox(height: 10),
        const Text('Habilidades: ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            child: Image.network(
              characters[widget.index].abilities![0].displayIcon!,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: Colors.black,
            ),
            onTap: () async {
              return alert(context,
                  title: Text(
                      'Habilidad ${characters[widget.index].abilities![0].displayName}'),
                  content: AbilityDescriptionWidget(
                      ability: characters[widget.index].abilities![0],
                      widget: widget));
            },
          ),
          GestureDetector(
            child: Image.network(
              characters[widget.index].abilities![1].displayIcon!,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: Colors.black,
            ),
            onTap: () async {
              return alert(context,
                  title: Text(
                      'Habilidad ${characters[widget.index].abilities![1].displayName}'),
                  content: AbilityDescriptionWidget(
                      ability: characters[widget.index].abilities![1],
                      widget: widget));
            },
          ),
          GestureDetector(
            child: Image.network(
              characters[widget.index].abilities![2].displayIcon!,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: Colors.black,
            ),
            onTap: () async {
              return alert(context,
                  title: Text(
                      'Habilidad ${characters[widget.index].abilities![2].displayName}'),
                  content: AbilityDescriptionWidget(
                      ability: characters[widget.index].abilities![2],
                      widget: widget));
            },
          ),
          GestureDetector(
            child: Image.network(
              characters[widget.index].abilities![3].displayIcon!,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: Colors.black,
            ),
            onTap: () async {
              return alert(context,
                  title: Text(
                      'Habilidad ${characters[widget.index].abilities![3].displayName}'),
                  content: AbilityDescriptionWidget(
                      ability: characters[widget.index].abilities![3],
                      widget: widget));
            },
          ),
        ])
      ],
    );
  }
}
