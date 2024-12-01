class cenarioClass {
  final String img;
  final String descricao;

  const cenarioClass(this.img, this.descricao);
}

class TrilhaClass {
  final String img;
  final String descricao;
  final String audioUrl;

  TrilhaClass(this.img, this.descricao, this.audioUrl);
}

class dicaClass {
  final String img;
  final String titulo;
  final String descricao;

  const dicaClass(this.img, this.titulo, this.descricao);
}

class personagemClass {
  final String img;
  final String nome;
  final String descricao;

  const personagemClass(this.img, this.nome, this.descricao);
}

class historiaClass {
  final String descricao;
  const historiaClass(this.descricao);
}

class ds {
  final String nome;
  final String img;
  final String cargo;
  const ds(
    this.nome,
    this.img,
    this.cargo,
  );
}
