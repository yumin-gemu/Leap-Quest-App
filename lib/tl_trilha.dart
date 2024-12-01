import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tccs/classes.dart';
import 'package:tccs/tl_cenario.dart';
import 'package:tccs/tl_dica.dart';
import 'package:tccs/tl_personagem.dart';
import 'package:tccs/tl_historia.dart';

class tl_trilha extends StatefulWidget {
  tl_trilha({super.key});

  @override
  State<tl_trilha> createState() => _TrilhaState();
}

class _TrilhaState extends State<tl_trilha> {
  int index = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<TrilhaClass> trilhas = [
    TrilhaClass(
      'assets/img/rio.png', // Caminho da imagem correto
      'Fase 2', // Descrição
      'https://www.dropbox.com/scl/fi/hr6dfd60h41k209h0rsmk/Fase2.ogg?rlkey=bju6gw27aoulw807pj174ifw9&st=o1ohlzei&raw=1',
    ),
    TrilhaClass(
      'assets/img/labirinto.png',
      'Fase 3',
      'https://www.dropbox.com/scl/fi/y9ice63rt16kho8l2zve5/Fase3.mp3?rlkey=9yziz44lnnfrfujeeeeoxvzlx&st=zpt0egvj&raw=1',
    ),
    TrilhaClass(
      'assets/img/cidadela.png',
      'Fase 4',
      'https://www.dropbox.com/scl/fi/acx3o93n5ynkgq9utjw0m/Fase4.mp3?rlkey=6auyymiuwpoi8gpl297m13aor&st=j704tzm0&raw=1',
    ),
    TrilhaClass(
      'assets/img/fronteira_final.png',
      'Fase 5',
      'https://www.dropbox.com/scl/fi/5zmxvuzvd86ck3elnqpan/Fase5.mp3?rlkey=rzimm9bnyc9l2uqddepbhgkzh&st=664f1iui&raw=1',
    ),
  ];

  void tocarAudio(String url) async {
    await _audioPlayer
        .stop(); // Para o áudio anterior antes de tocar o próximo.
    await _audioPlayer.play(url);
  }

  void avancarTrilha() {
    setState(() {
      index = (index + 1) % trilhas.length;
      tocarAudio(trilhas[index].audioUrl);
    });
  }

  void voltarTrilha() {
    setState(() {
      index = (index - 1 + trilhas.length) % trilhas.length;
      tocarAudio(trilhas[index].audioUrl);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Libera recursos ao sair.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 52, 94),
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
          const Text('TRILHAS',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'MotterCorpusStd-Regular',
                fontWeight: FontWeight.w700,
              )),
          CarouselSlider.builder(
            itemCount: trilhas.length,
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
                      trilhas[index].img,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        tocarAudio(trilhas[index].audioUrl);
                      },
                      child: const Text('Tocar Música'),
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
                tocarAudio(trilhas[index].audioUrl);
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => tl_dica()));
        },
        child: Image.asset(
          name,
          height: 400,
          width: 400,
        ));
  }
}
