import 'dart:collection';
import 'dart:convert';

import 'package:password_hash_plus/password_hash_plus.dart';
class Login{
  late int id;
  late String email;
  late String senha;
  late int nivel_acesso;
  Map<String, String>  usuarios = new HashMap();

  void addLogin(String email, String senha) {
    usuarios.containsKey(email) ? print('Email já cadastrado: $email') : usuarios[email] = _hashSenha(senha);
  }

  String _hashSenha(String senha) {
    PBKDF2 generator = new PBKDF2();
    String salt = Salt.generateAsBase64String(6);
    List<int> hash = generator.generateKey(senha, salt, 1000, 24);
    String hashBase64 = base64Encode(hash);
    return '$salt:$hashBase64';
  }

  static bool verificaSenha(String senha, String hashArmazenado) {
    PBKDF2 generator = new PBKDF2();
    List<String> hashParts = hashArmazenado.split(':');
    List<int> hashCalculado = generator.generateKey(senha, hashParts[0], 1000, 24);
    String hashEncoded = base64Encode(hashCalculado);
    return hashParts[1] == hashEncoded;
  }

  bool validaUsuario(String email, String senha) {
    return usuarios.containsKey(email) && verificaSenha(senha, usuarios[email]!);
  }

}