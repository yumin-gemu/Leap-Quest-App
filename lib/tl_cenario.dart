import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tccs/classes.dart';
import 'package:tccs/tl_desenvolvedores.dart';
import 'package:tccs/tl_dica.dart';
import 'package:tccs/tl_historia.dart';
import 'package:tccs/tl_personagem.dart';
import 'package:tccs/tl_trilha.dart';

class tl_cenario extends StatefulWidget {
  tl_cenario({super.key});

  @override
  State<tl_cenario> createState() => _cenario();
}

class _cenario extends State<tl_cenario> {
  int index = 0;
  List<cenarioClass> tlcenario = [
    const cenarioClass(
      'assets/img/rodovia.png',
      'O Local inicial, onde o protagonista acha os primeiros rastros do artefato. ',
    ),
    const cenarioClass(
      'assets/img/rio.png',
      'Faça saltos em pedras e em troncos, pegue as reliquias e entre na gruta',
    ),
    const cenarioClass(
      'assets/img/labirinto.png',
      'Se equilibre nos troncos e siga os simbolos para passar de fase. ',
    ),
    const cenarioClass(
      'assets/img/cidadela.png',
      'Seja mais rapido do que o ZibZib e pegue a reliquia. ',
    ),
    const cenarioClass(
      'assets/img/fronteira_final.png',
      'Recupere a reliquia e encontre uma saida.',
    ),
  ];

  void avancarcenario() {
    setState(() {
      index = (index + 1) % tlcenario.length;
    });
  }

  void voltarcenario() {
    setState(() {
      index = (index - 1 + tlcenario.length) % tlcenario.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 52, 94),
      appBar: AppBar(
        leading: imagem(name: 'assets/icon/1.png'),
        title: const Text('LEAP QUEST',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontFamily: 'MotterCorpusStd-Regular',
              fontWeight: FontWeight.w700,
            )),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CENÁRIO',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'MotterCorpusStd-Regular',
                fontWeight: FontWeight.w700,
              )),
          CarouselSlider.builder(
            itemCount: tlcenario.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff62073e), Color(0xff2667a4)],
                    stops: [0.25, 0.75],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      tlcenario[index].img,
                      height: 250,
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tlcenario[index].descricao,
                      style: const TextStyle(
                          fontFamily: "Comic Sans",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 450,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  this.index = index;
                });
              },
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff62073e), Color(0xff2667a4)],
                stops: [0.25, 0.75],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tl_personagem()));
                    }
                  },
                  child: Image.asset('assets/icon/Controle(jogo).png',
                      width: 50, height: 50),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => tl_dica(),
                        ));
                  },
                  child: Image.asset('assets/icon/Lampada(dica).png',
                      width: 50, height: 50),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => tl_historia()));
                  },
                  child: Image.asset('assets/icon/Livro(historia).png',
                      width: 50, height: 50),
                ),
                GestureDetector(
                  onTap: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tl_cenario()));
                    }
                  },
                  child: Image.asset('assets/icon/Mapa(fases).png',
                      width: 50, height: 50),
                ),
                GestureDetector(
                  onTap: () {
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => tl_trilha()));
                    }
                  },
                  child: Image.asset('assets/icon/Musica(trilha).png',
                      width: 50, height: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imagem({required String name}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tl_desenvolvedores()));
        },
        child: Image.asset(
          name,
          height: 400,
          width: 400,
        ));
  }
}
