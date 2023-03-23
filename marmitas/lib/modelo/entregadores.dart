class Entregador{
  late int id;
  late int idEmpresa;
  late String nome;
  late String cpf;
  late String rg;
  late int taxa;
  late String celular;
  late int qtd = 0;

  static List<Entregador> entregadores = [];

  String getEntregador(int id){
    String dados = "";
    if(entregadores.contains(id)){
      dados += "ID: ${entregadores[id].id} \n"
          "ID Empresa: ${entregadores[id].idEmpresa} \n"
          "Nome: ${entregadores[id].nome} \n"
          "CPF: ${entregadores[id].cpf} \n"
          "RG: ${entregadores[id].rg} \n"
          "Celular: ${entregadores[id].celular} \n";
          "Taxas: ${entregadores[id].taxa}\n";
    }
    return dados;
  }

  void addEntregadores(Entregador entregador){
    entregadores.add(entregador);
    qtd++;
  }

  String getAllEntregadores(){
    String dados = "";
    for(int i = 0; i < entregadores.length; i++){
      dados += "ID: ${entregadores[i].id} \n"
          "ID Empresa: ${entregadores[i].idEmpresa} \n"
          "Nome: ${entregadores[i].nome} \n"
          "CPF: ${entregadores[i].cpf} \n"
          "RG: ${entregadores[i].rg} \n"
          "Celular: ${entregadores[i].celular} \n";
          "Taxas: ${entregadores[id].taxa}\n";
    }
    return dados;
  }

  String getNomeByEntregador(int id){
    return entregadores[id].nome;
  }

  String entregadorComMaisCorridas(){
    int maior = entregadores.fold(0, (prev, entregadores) => entregadores.id > prev ? entregadores.id : prev);
    Entregador entregadorComMaisEntregas = entregadores.firstWhere((entregadores) => entregadores.id == maior);
    String dados = "Esse é o entregador que possui mais entregas: ${entregadorComMaisEntregas.nome} com ${entregadorComMaisEntregas.qtd} entregas";
    return dados;
  }
    // for(int i = 0; i<entregadores.length; i++){
    //   if(entregadores[i].qtd > maior){
    //     maior = entregadores[i].qtd;
    //     dados += "Esse é o entregador que possui mais entregas: ${getEntregadores()}";
    //   }
    // }
    // return dados

  String entregadorComMenosCorridas(){
    int menor = entregadores.fold(0, (prev, entregadores) => entregadores.id < prev ? entregadores.id : prev);
    Entregador entregadorComMenosEntregas = entregadores.firstWhere((entregadores) => entregadores.id == menor);
    String dados = "Esse é o entregador que possui menos entregas: ${entregadorComMenosEntregas.nome} com ${entregadorComMenosEntregas.qtd} entregas";
    return dados;
  }

}