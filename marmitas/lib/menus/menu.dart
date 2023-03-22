void menuLogin() {
  [
    "(1) - Login",
    "(2) - Cadastrar"
  ].forEach(print);
}

void menuPrincipal() {
  [
    "Menu Principal",
    "1 - Cadastros",
    "2 - Pedidos",
    "3 - Entregas",
    "4 - Relatórios",
    "5 - Sair"
  ].forEach(print);
}

void menuCadastros() {
  [
  "Menu Cadastros",
  "1 - Clientes",
  "2 - Logins",
  "3 - Marmitas",
  "4 - Entregadores",
  "5 - Empresas",
  "6 - Sair"
  ].forEach(print);
}

void menuRelatorios(){
  [
    "Qual relatorio deseja ver:",
    "(1) - Marmitas",
    "(2) - pedidos",
    "(3) - entregadores",
    "(4) - entregador com menos corridas",
    "(5) - pedidos por clientes"
  ].forEach(print);
}