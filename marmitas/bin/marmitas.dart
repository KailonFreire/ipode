import 'dart:io';

import 'package:marmitas/menus/menu.dart';
import 'package:marmitas/modelo/cliente.dart';
import 'package:marmitas/modelo/empresas.dart';
import 'package:marmitas/modelo/entregadores.dart';
import 'package:marmitas/modelo/itensPedidos.dart';
import 'package:marmitas/modelo/logins.dart';
import 'package:marmitas/modelo/marmitas.dart';
import 'package:marmitas/modelo/pedidos.dart';


Marmita m = Marmita();
Cliente cl = Cliente("", "", "", "","", 0);
Entregador entregador = Entregador();
Empresa empresa = Empresa();
Marmita marmita = Marmita();
Pedido pedido = Pedido();
Login login = Login();
ItemPedido itemPedido = ItemPedido();

void inicializarDados(){
  //logins
  login.id = 1;
  login.email = "carlos";
  login.senha = "1234";
  login.nivel_acesso = 1;
  login.addLogin(login.email, login.senha);

  //Empresa
  empresa.id = 1;
  empresa.nome = "SENAI";
  empresa.cnpj = "1111111";
  empresa.email = "senai@fieb.org.br";
  empresa.telefone = "71 98763-5727";
  empresa.endereco = "CETIND";
  empresa.addEmpresa(empresa);

  //Marmitas
  marmita.id = 1;
  marmita.nome = "Comida Baiana";
  marmita.descricao = "Caruru, vatapa, farofa, frango ou peixe";
  marmita.tamanho = "pequena";
  marmita.valor = 20;
  marmita.addMarmitas(marmita);

  //clientes
  cl.telefone = "71 98763-5727";
  cl.nome = "Anildo";
  cl.endereco = "Brotas";
  cl.pontoReferencia = "Colegio Mediterraneo";
  cl.dataNascimento = "1986-03-05";
  cl.addClientes(cl);

  //Entregadores
  entregador.id = 1;
  entregador.idEmpresa = 1;
  entregador.nome = "João";
  entregador.cpf = "0223521465";
  entregador.rg = "5547896";
  entregador.celular = "71 987552412";
  entregador.addEntregadores(entregador);

  //Peidos
  pedido.id = 1;
  pedido.idEntregador = 1;
  pedido.telefoneCliente = "71 98763-5727";
  pedido.status = "Preparando";
  pedido.taxaEntrega = 10;
  pedido.data = DateTime.parse("2023-03-10");
  pedido.addPedidos(pedido);

  pedido.id = 2;
  pedido.idEntregador = 1;
  pedido.telefoneCliente = "71 98763-5727";
  pedido.status = "Preparando";
  pedido.taxaEntrega = 10;
  pedido.data = DateTime.parse("2023-04-10");
  pedido.addPedidos(pedido);

  //Itens Pedidos
  itemPedido.idMarmita = 1;
  itemPedido.idPedido = 1;
  itemPedido.quantidade = 2;
  itemPedido.addItens_Pedidos(itemPedido);

  itemPedido.idMarmita = 1;
  itemPedido.idPedido = 2;
  itemPedido.quantidade = 3;
  itemPedido.addItens_Pedidos(itemPedido);
}

void cadastrarPedido(){
  print("Informe o ID do pedido");
  pedido.id = int.parse(stdin.readLineSync()!);

  print(cl.getClientes());
  print("Informe o telefone do cliente");
  pedido.telefoneCliente = stdin.readLineSync()!;

  print("Informe o id do Entregador");
  pedido.idEntregador = int.parse(stdin.readLineSync()!);

  pedido.status = "Preparando";
  print("Informe o valor da taxa");
  pedido.taxaEntrega = double.parse(stdin.readLineSync()!);
  pedido.data = DateTime.now();
  pedido.addPedidos(pedido);

  int opItens = 0;

  do{
      int idMarmita = 0;
      print("Cadastrar Itens do Pedido");
      print(marmita.getMarmitas());
      print("Informe o id da Marmita");
      idMarmita = int.parse(stdin.readLineSync()!);
      cadastrarItensPedido(pedido.id, idMarmita);
      print("Deseja cadastrar outro item? [1 SIM]");
      opItens = int.parse(stdin.readLineSync()!);
  }while(opItens == 1);
  print("Pedido finalizado");
  print(pedido.getPedidos());

}

void cadastrarItensPedido(int idPedido, int idMarmita){
  ItemPedido item_pedido = ItemPedido();
  item_pedido.idPedido = idPedido;
  item_pedido.idMarmita = idMarmita;
  print("Informe a quantidade desejada");
  item_pedido.quantidade = int.parse(stdin.readLineSync()!);
  item_pedido.addItens_Pedidos(item_pedido);
  print(item_pedido.getItensPedidos());
}

void cadastrarCliente(){
  print("informe o tel: ");
  cl.telefone = stdin.readLineSync()!;
  print("Nome: ");
  cl.nome = stdin.readLineSync()!;
  print("endereço: ");
  cl.endereco = stdin.readLineSync()!;
  cl.id = Cliente.clientes.last.id > 0 ? Cliente.clientes.last.id + 1 : 1;
  cl.addClientes(cl);
}

void cadastrarEmpresa(){
  print("Informe o nome da empresa: ");
  entregador.nome = stdin.readLineSync()!;
  entregador.id = Entregador.entregadores.last.id > 0 ? Entregador.entregadores.last.id + 1 : 1;
  print("Informe o id da empresa: ");
  entregador.idEmpresa = int.parse(stdin.readLineSync()!);
  print("Informe o RG do entregador: ");
  entregador.rg = stdin.readLineSync()!;
  print("Informe o CPF do entregador: ");
  entregador.cpf = stdin.readLineSync()!;
  print("Informe o telefone do entregador: ");
  entregador.celular = stdin.readLineSync()!;
  entregador.addEntregadores(entregador);
  print(entregador.getEntregador(entregador.id));
}

void autenticacao(){
  String senha, email;

  print("Acesso Administrativo");
  do{
    print("Informe seu email");
    email = stdin.readLineSync()!;
    print("Informe a senha");
    senha = stdin.readLineSync()!;
  }while(login.validaUsuario(email, senha) == false);
}

void main(List<String> arguments) {
  int op = 0, opL = 0;
  inicializarDados();
  do {
    print("(1) - Logar \n"
        "(2) - Criar conta"
        );
    opL = int.parse(stdin.readLineSync()!);
    if(opL == 1){
      autenticacao();
      do {
        menuPrincipal();
        op = int.parse(stdin.readLineSync()!);
        switch (op) {
        //Cadastros
          case 1:
            int opC = 0;
            do {
              menuCadastros();
              opC = int.parse(stdin.readLineSync()!);
              switch (opC) {
                case 1:
                //clientes
                  cadastrarCliente();
                  break;
                case 2:
                //Entregadores
                  print("Informe o nome da empresa: ");
                  empresa.nome = stdin.readLineSync()!;
                  empresa.id = Empresa.empresas.last.id > 0
                      ? Empresa.empresas.last.id + 1
                      : 1;
                  print("Informe o cnpj da empresa: ");
                  empresa.cnpj = stdin.readLineSync()!;
                  print("Informe o email da empresa: ");
                  empresa.email = stdin.readLineSync()!;
                  print("Informe a senha:");
                  empresa.senha = stdin.readLineSync()!;
                  print("Informe o endereço da empresa: ");
                  empresa.endereco = stdin.readLineSync()!;
                  print("Informe o telefone da empresa: ");
                  empresa.telefone = stdin.readLineSync()!;
                  empresa.addEmpresa(empresa);
                  login.addLogin(empresa.email, empresa.senha);
                  print(empresa.getEmpresa(empresa.id));
                  break;
                case 3:
                //Empresas
                  cadastrarEmpresa();
                  break;
                case 4:
                //Marmitas
                  marmita.id = Marmita.marmitas.last.id > 0
                      ? Marmita.marmitas.last.id + 1
                      : 1;
                  print("Informe o nome da marmita: ");
                  marmita.nome = stdin.readLineSync()!;
                  print("Informe a descrição da marmita: ");
                  marmita.descricao = stdin.readLineSync()!;
                  print("Informe o tamanho da marmita: ");
                  marmita.tamanho = stdin.readLineSync()!;
                  print("Informe o valor da marmita: ");
                  marmita.valor = double.parse(stdin.readLineSync()!);
                  marmita.addMarmitas(marmita);
                  print(marmita.getMarmitas());
                  break;
                case 5:
                //Entregador
                  print("Informe o id do entregador: ");
                  pedido.idEntregador = int.parse(stdin.readLineSync()!);
                  print("Informe o tel do entregador: ");
                  pedido.telefoneCliente = stdin.readLineSync()!;
                  pedido.addPedidos(pedido);
                  pedido.getPedidos();
                  break;
                case 6:
                  print("Informe o id do pedido: ");
                  itemPedido.idPedido =
                  Pedido.pedidos.last.id > 0 ? Pedido.pedidos.last.id + 1 : 1;
                  print("Innforme o id da marmita: ");
                  itemPedido.idMarmita = int.parse(stdin.readLineSync()!);
                  print("Innforme a quantidade: ");
                  itemPedido.quantidade = int.parse(stdin.readLineSync()!);
                  itemPedido.addItens_Pedidos(itemPedido);
                  break;
              }
            } while (opC != 7);
            break;
          case 2:
          //Pedidos
            cadastrarPedido();
            break;
          case 3:
          //Entregas
            print("Informe o id do pedido: ");
            int id = int.parse(stdin.readLineSync()!);
            pedido.stats(id);
            break;
          case 4:
          //relatorios
            int opR = 0;

            do {
              menuRelatorios();
              opR = int.parse(stdin.readLineSync()!);
              switch (opR) {
                case 1:
                  print("Informe o id do pedido");
                  // int idPedido = int.parse(stdin.readLineSync()!);
                  // print(pedido.getPedidoMarmitaQtd(idPedido));
                  m.getMarmitaMaisVendida();
                  m.getMarmitaMenosVendida();
                  break;
                case 2:
                  print("Informe o telefone do cliente");
                  String telCliente = stdin.readLineSync()!;
                  pedido.getPedidosByTel(telCliente);
                  break;
                case 3:
                //Entregador por id
                  print("Informe o telefone do entregador: ");
                  String telEntregador = stdin.readLineSync()!;
                  Entregador entregadorByTel = Entregador.entregadores
                      .firstWhere((entregadores) =>
                  entregadores.celular == telEntregador);
                  print(entregador.getEntregador(entregadorByTel.id));
                  print(entregador.entregadorComMaisCorridas());
                  break;
                case 4:
                //Entregador com menos corridas
                  print(entregador.entregadorComMenosCorridas());
                  break;
                case 5:
                //exibir pedidos por clientex
                  print("Informe o telefone do cliente: ");
                  String telCliente = stdin.readLineSync()!;
                  pedido.getPedidosByTel(telCliente); //71 98763-5727
                  print(cl.getClienteByTel(telCliente));
                  break;
                case 6:
                  print("Voltando ao menu principal");
              }
            } while (opR != 6);
            break;
        }
      }while (op != 5);
    } else if(opL == 2){
      String email = "";
      String senha = "";
      print("Informe o email: ");
      email = stdin.readLineSync()!;
      print("Informe a senha: ");
      senha = stdin.readLineSync()!;
      login.addLogin(email, senha);
    }
  }while(opL != 3);
}
