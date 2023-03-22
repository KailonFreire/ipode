class Cliente{
  late String telefone;
  late String nome;
  late String endereco;
  late String pontoReferencia;
  late String dataNascimento;
  late int id;

  static List<Cliente> clientes = [];

  Cliente(this.nome, this.telefone, this.pontoReferencia, this.endereco, this.dataNascimento, this.id);

  String getClientes(){
    String dados = "";
    for(int i = 0; i < clientes.length; i++){
      dados += "Telefone: ${clientes[i].telefone} \n"
          "Nome: ${clientes[i].nome} \n"
          "Endereço: ${clientes[i].endereco} \n"
          "Referencia: ${clientes[i].pontoReferencia} \n"
          "Nascimento: ${clientes[i].dataNascimento} \n";
    }
    return dados;
  }
  String getClienteByTel(String tel){
    Cliente clienteByTel = Cliente.clientes.firstWhere((clientes) => clientes.telefone == tel);
    int id = clienteByTel.id;
    String dados = "Telefone: ${clientes[id].telefone} \n"
          "Nome: ${clientes[id].nome} \n"
          "Endereço: ${clientes[id].endereco} \n"
          "Referencia: ${clientes[id].pontoReferencia} \n"
          "Nascimento: ${clientes[id].dataNascimento} \n";
    return dados;
  }

  void addClientes(Cliente cliente){
    clientes.add(cliente);
  }

  List<Cliente> getAllClientes(){
    return clientes;
  }

  String getNomeByCliente(String telefone){
    String dados = "";
    for(int i = 0; i < clientes.length; i++){
      dados += clientes[i].nome;
      break;
    }
    return dados;
  }

}