class Empresa{
  late int id;
  late String nome;
  late String cnpj;
  late String email;
  late String senha;
  late String telefone;
  late String endereco;
  static List<Empresa> empresas = [];

  void addEmpresa(Empresa empresa){
    empresas.add(empresa);
  }

  List<Empresa> getAllEmpresas(){
    return empresas;
  }
  String getEmpresa (int id){
    String dados = "rpz";
    if(empresas.contains(id)){
      dados += "ID: ${empresas[id].id} \n"
          "Email Empresa: ${empresas[id].email} \n"
          "Nome: ${empresas[id].nome} \n"
          "CNPJ: ${empresas[id].cnpj} \n"
          "Endereço: ${empresas[id].endereco} \n"
          "Celular: ${empresas[id].telefone} \n";
    }
    return dados;
  }

  String getDados(){
    String dados = "";
    for(int i = 0; i < empresas.length; i++){

      dados += "Id: ${empresas[i].id} \n"
          "Nome: ${empresas[i].nome} \n"
          "CNPJ: ${empresas[i].cnpj} \n"
          "Email: ${empresas[i].email} \n"
          "Telefone: ${empresas[i].telefone} \n"
          "Endereço: ${empresas[i].endereco}";
    }
    return dados;
  }
}