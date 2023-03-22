class ItemPedido{
  late int idMarmita;
  late int idPedido;
  late int quantidade;

  static List<ItemPedido> itensPedidos = [];

  String getItensPedidos(){
    String dados = "";
    for(int i = 0; i < itensPedidos.length; i++){
      dados += "ID Marmita: ${itensPedidos[i].idMarmita} \n"
          "ID Pedido: ${itensPedidos[i].idPedido} \n"
          "Quantidade: ${itensPedidos[i].quantidade} \n";
    }
    return dados;
  }

  void addItens_Pedidos(ItemPedido item_pedido){
    itensPedidos.add(item_pedido);
  }

  List<ItemPedido> getAllItensPedidos(){
    return itensPedidos;
  }
}