import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tccs/classes.dart';
import 'package:tccs/tl_cenario.dart';
import 'package:tccs/tl_desenvolvedores.dart';
import 'package:tccs/tl_historia.dart';
import 'package:tccs/tl_personagem.dart';
import 'package:tccs/tl_trilha.dart';

class tl_dica extends StatefulWidget {
  tl_dica({super.key});

  @override
  State<tl_dica> createState() => _dica();
}

class _dica extends State<tl_dica> {
  int index = 0;
  List<dicaClass> tldicas = [
    const dicaClass(
      'assets/img/fase1.png',
      'Dica 1',
      'Evite os carros na rodovia! Mantenha-se atento para não ser atropelado.',
    ),
    const dicaClass(
      'assets/img/fase2.png',
      'Dica 2',
      'Use os troncos para atravessar o rio. Mas cuidado, alguns podem afundar.',
    ),
    const dicaClass(
      'assets/img/fase3.png',
      'Dica 3',
      'Mantenha-se equilibrado nos troncos.',
    ),
    const dicaClass(
      'assets/img/fase4.png',
      'Dica 4',
      'Preste atenção nos inimigos e corra!',
    ),
    const dicaClass(
      'assets/img/DFase5.png',
      'Dica 5',
      'Pegue a reliquia, evite os aliens e corra para a nave!',
    ),
  ];

  void avancarDica() {
    setState(() {
      index = (index + 1) % tldicas.length;
    });
  }

  void voltarDica() {
    setState(() {
      index = (index - 1 + tldicas.length) % tldicas.length;
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
          Text('DICAS',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'MotterCorpusStd-Regular',
                fontWeight: FontWeight.w700,
              )),
          CarouselSlider.builder(
            itemCount: tldicas.length,
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
                      tldicas[index].img,
                      height: 250,
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tldicas[index].titulo,
                      style: const TextStyle(
                          fontFamily: "Comic Sans",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tldicas[index].descricao,
                      style: const TextStyle(
                          fontFamily: "Comic Sans",
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
