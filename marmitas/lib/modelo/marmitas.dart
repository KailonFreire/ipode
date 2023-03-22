class Marmita{
  late int id;
  late String nome;
  late String descricao;
  late String tamanho;
  late double valor;
  late int qtd = 0;
  static List<Marmita> marmitas = [];

  void addMarmitas(Marmita marmita){
    marmitas.add(marmita);
  }

  List<Marmita> getAllMarmitas(){
    return marmitas;
  }

  String getMarmitas(){
    String dados = "";

    for(int i = 0; i < marmitas.length; i++){
      dados += "Id: ${marmitas[i].id} \n"
          "Nome: ${marmitas[i].nome} \n"
          "Descrição: ${marmitas[i].descricao} \n"
          "Tamanho: ${marmitas[i].tamanho} \n"
          "Valor: ${marmitas[i].valor}";
      marmitas[i].qtd++;
    }
    return dados;
  }

  void getMarmitaMaisVendida(){
      int maior = 0;
      for(int i = 0; i < marmitas.length; i++){
        if(marmitas[i].qtd > maior){
          maior = marmitas[i].qtd;
          print("Mais vendidas: "+getMarmitas());
        }
        break;
      }
  }
 void getMarmitaMenosVendida(){
    int menor = marmitas[0].qtd;
    for(int i = 0; i < marmitas.length; i++){
      if(marmitas[i].qtd < menor){
        menor = marmitas[i].qtd;
        print("Menos vendidas: "+getMarmitas());
      }
      break;
    }
 }
}
