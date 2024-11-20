import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pto2/models/character_model.dart';
import 'package:pto2/services/character_service.dart';
import 'package:pto2/widgets/character_information_widget.dart';
import 'package:pto2/widgets/character_view_widget.dart';

class HomeScreen extends StatefulWidget {
  int index = 0;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> characters = [];
  CharacterService characterService = CharacterService();
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          title: Image.network(
              // 'https://static.vecteezy.com/system/resources/previews/022/636/374/non_2x/valorant-logo-valorant-icon-transparent-free-png.png'
              'https://img.icons8.com/color/512/valorant.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover),
          centerTitle: true,
          leading: (characters.isNotEmpty)
              ? IconButton(
                  icon: const Icon(Icons.replay_outlined),
                  color: Colors.white,
                  onPressed: () {
                    widget.index = 0;
                    setState(() {});
                  },
                )
              : Container(),
          actions: [
            (characters.isEmpty)
                ? IconButton(
                    icon: const Icon(Icons.arrow_circle_down),
                    color: Colors.white,
                    onPressed: () async {
                      characters = await characterService.getCharacters();
                      setState(() {});
                    },
                  )
                : Container()
          ],
        ),
        body: Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: (characters.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Pulse para mostrar datos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: maxHeight * 0.05),

                      // Widget de carga
                      SizedBox(
                        height: maxHeight * 0.05,
                        child: const LoadingIndicator(
                          indicatorType: Indicator.ballSpinFadeLoader,
                          colors: [Colors.white],
                          strokeWidth: 5,
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      CharactersView(character: characters[widget.index]),
                      SizedBox(height: maxHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (widget.index == 0) {
                                widget.index = characters.length - 1;
                              } else {
                                widget.index--;
                              }
                              setState(() {});
                            },
                            child: const Text('Anterior'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              return alert(context,
                                  title: Text(
                                    'Información de ${characters[widget.index].displayName}',
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic),
                                  ),
                                  content: CharacterInformationWidget(
                                      characters: characters, widget: widget));
                            },
                            child: const Icon(Icons.info_outline),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (widget.index == characters.length - 1) {
                                widget.index = 0;
                              } else {
                                widget.index++;
                              }
                              setState(() {});
                            },
                            child: const Text('Siguiente'),
                          )
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
