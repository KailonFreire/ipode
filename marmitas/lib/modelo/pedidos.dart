import 'package:marmitas/modelo/cliente.dart';
import 'package:marmitas/modelo/entregadores.dart';
import 'package:marmitas/modelo/itensPedidos.dart';
import 'package:marmitas/modelo/marmitas.dart';

class Pedido{
  late int id;
  late String telefoneCliente;
  late int idEntregador;
  late String status = "A caminho";
  late double taxaEntrega;
  late DateTime data;


  static List<Pedido> pedidos = [];

  String getPedidos(){
    String dados = "";
    for(int i = 0; i < pedidos.length; i++){
      dados += "ID: ${pedidos[i].id} \n"
          "Telefone Cliente: ${pedidos[i].telefoneCliente} \n"
          "Id Entregador: ${pedidos[i].idEntregador} \n"
          "Status: ${pedidos[i].status} \n"
          "Taxa Entrega: ${pedidos[i].taxaEntrega} \n"
          "Data: ${pedidos[i].data} \n";
    }
    return dados;
  }

  void getPedidosByTel(String tel){
    String dados = "";
    Iterable<Pedido> pedidosByTel = Pedido.pedidos.where((pedidos) => pedidos.telefoneCliente == tel);

    // pedidosByTel.forEach((element) {
    //  dados +=
    //  [
    //    "Telefone do cliente: ${pedidos[id].telefoneCliente} \n"
    //       "ID do entregador: ${pedidos[id].idEntregador} \n"
    //       "Status do pedido: ${pedidos[id].status} \n"
    //       "Taxa de entrega: ${pedidos[id].taxaEntrega} \n"
    //       "data: ${pedidos[id].data} \n"
    // ].forEach(print);
    // });
    pedidosByTel.forEach((pedidos) {
      Pedido p = Pedido.pedidos.firstWhere((pedidos) => pedidos.telefoneCliente == tel);
      Cliente c = Cliente.clientes.firstWhere((c) => c.telefone == telefoneCliente);
      ItemPedido ip = ItemPedido.itensPedidos.firstWhere((ip) => ip.idPedido == id);
      Marmita m = Marmita.marmitas.firstWhere((m) => m.id == ip.idMarmita);
      Entregador e = Entregador.entregadores.firstWhere((e) => e.id == idEntregador);
      [
      'cliente: ${c.nome}',
      'marmita: ${m.nome}',
      'data: $p.data',
      'entregador: ${e.nome}',
      'total: ${m.valor * ip.quantidade}'
      ].forEach(print);
    });

  }


  void stats(int id){
    pedidos.contains(id) ? pedidos[id].status = "entregue" : print("Nenhum pedido para atualizar!");

   print(getPedidos());
  }

  void addPedidos(Pedido pedido){
    pedidos.add(pedido);
  }

  List<Pedido> getAllPedidos(){
    return pedidos;
  }

  String getPedidoMarmitaQtd(int idPedido) {
    String dados = "";
    int id = idPedido;
    // for(pedidos in pedidos[id]) {
    //   dados += "Telefone do cliente: ${pedidos[id].telefoneCliente} \n"
    //       "ID do entregador: ${pedidos[id].idEntregador} \n"
    //       "Status do pedido: ${pedidos[id].status} \n"
    //       "Taxa de entrega: ${pedidos[id].taxaEntrega} \n"
    //       "data: ${pedidos[id].data} \n";
    // }
    return dados;
  }

}