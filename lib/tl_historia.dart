import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tccs/classes.dart';
import 'package:tccs/tl_cenario.dart';
import 'package:tccs/tl_desenvolvedores.dart';
import 'package:tccs/tl_dica.dart';
import 'package:tccs/tl_personagem.dart';
import 'package:tccs/tl_trilha.dart';

class tl_historia extends StatefulWidget {
  tl_historia({super.key});

  @override
  State<tl_historia> createState() => _historia();
}

class _historia extends State<tl_historia> {
  int index = 0;
  List<historiaClass> tlhistoria = [
    const historiaClass(
        'Sua aventura começa em uma rodovia desolada e envolta em névoa. O asfalto, coberto de rachaduras e marcas misteriosas, emana uma sensação de perigo iminente. Leap, guiado por estranhas pistas deixadas pelos alienígenas, segue pela estrada, sentindo a presença invisível de algo ou alguém observando. As sombras, que parecem se mover à margem da estrada, sugerem que Leap está longe de estar sozinho.'),
    const historiaClass(
      'Encontre obstáculos, como veículos abandonados e escombros, que bloqueiam seu caminho, forçando-o a desvendar a melhor rota para avançar. O vento frio e o silêncio perturbador aumentam a tensão. No final da estrada, Leap chega a um porto abandonado, onde as pistas, antes tão claras, subitamente desaparecem. O que parecia ser um caminho definido se transforma em um mistério profundo. Mas Leap sabe que o próximo passo o levará ainda mais fundo em sua jornada.',
    ),
    const historiaClass(
      'Leap avista o mar turbulento à frente, onde símbolos alienígenas estão em cima lago. Para chegar até eles, Leap precisa realizar manobras perigosas de parkour, pulando entre rochas escorregadias e atravessando plataformas que se desintegram ao toque. Cada movimento é calculado, pois um erro pode resultar em uma queda fatal nas águas agitadas',
    ),
    const historiaClass(
      'Superando o desafio de parkour, Leap mergulha no oceano. Enquanto nada pelas profundezas escuras e turbulentas, ele percebe destroços de antigos navios e escombros tecnológicos de origem alienígena. O brilho dos símbolos o guia até uma caverna submersa, onde uma escada antiga emerge das águas. O ar parece diferente aqui, carregado de uma energia estranha e pul-sante. Ele sobe a escada, sentindo que está prestes a desvendar um segredo há muito tempo oculto.',
    ),
    const historiaClass(
      'Leap deve usar seu instinto e habilidades de sobrevivência para decifrar os símbolos esculpidos nas árvores e nas pedras, que indicam o caminho correto. O labirinto testa sua resistência e sagacidade a cada passo. No fim da trilha sinuosa, Leap encontra uma cidadela alienígena secreta, erguida no coração da selva, onde a relíquia que ele procura é venerada como um objeto sagrado.',
    ),
    const historiaClass(
        'A cidadela é um complexo imponente, cercado por alienígenas hostis e um sistema de segurança avançado, com câmeras e guardas patrulhando cons-tantemente. Leap, percebendo que um confronto direto seria suicídio, decide usar suas habilidades furtivas. Ele se esgueira pelas sombras, evitando ser visto e encontrando rotas alternativas para evitar os guardas.'),
    const historiaClass(
        'No centro da cidadela, uma pirâmide alienígena se ergue majestosa, protegida por mais armadilhas mortais e patrulhas. Leap escala a pirâmide, onde cada passo é uma batalha contra o tempo e a vigilância. No topo, ele finalmente en-contra a relíquia alienígena. Mas ao segurá-la, um portal misterioso se abre, sugando-o para um novo mundo: a Fronteira Final.'),
    const historiaClass(
        'Leap desperta na Fronteira Final, uma estrutura colossal em órbita ao redor da Terra, aparentemente construída por uma civilização desconhecida. Ele perce-be que os alienígenas estão em seu encalço, determinados a recuperar a relí-quia a qualquer custo. Correndo pelos corredores estreitos da estação orbital, Leap precisa desviar de obstáculos e escapar dos projéteis disparados contra ele.'),
    const historiaClass(
        'Conforme os inimigos se aproximam, Leap se vê encurralado. A única saída é um buraco negro que pulsa à frente, uma anomalia espacial que parece pro-meter destruição e salvação ao mesmo tempo. Sem opções, Leap toma a deci-são mais ousada de sua vida: ele salta no buraco negro, acreditando que, mesmo que isso signifique sua morte, a relíquia estará fora do alcance dos alienígenas.')
  ];

  void avancarhistoria() {
    setState(() {
      index = (index + 1) % tlhistoria.length;
    });
  }

  void voltarcenario() {
    setState(() {
      index = (index - 1 + tlhistoria.length) % tlhistoria.length;
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
          Text('HISTORIA',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'MotterCorpusStd-Regular',
                fontWeight: FontWeight.w700,
              )),
          CarouselSlider.builder(
            itemCount: tlhistoria.length,
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
                    Text(
                      tlhistoria[index].descricao,
                      style: const TextStyle(
                          fontFamily: "Comic Sans",
                          fontSize: 15,
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
