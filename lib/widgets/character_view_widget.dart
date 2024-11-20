import 'package:flutter/material.dart';
import 'package:pto2/models/character_model.dart';

class CharactersView extends StatefulWidget {
  final Character character;

  const CharactersView({
    super.key,
    required this.character,
  });

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    Character c = widget.character;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(c.background!),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SizedBox(
          height: maxHeight * 0.75,
          width: maxWidth,
          child: Image.network(c.bustPortrait!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
