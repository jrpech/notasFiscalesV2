import 'models/models.dart';
import 'package:flutter/material.dart';
import 'package:notas_fiscales/keys.dart';

class Constants {
  static final List<TabItem> tabs = [
    TabItem(title: "Noticias", icon: Icons.person, key: NotasFiscalesAppKeys.newsTab),
    TabItem(title: "Libros", icon: Icons.person, key: NotasFiscalesAppKeys.booksTab),
    TabItem(title: "Revistas", icon: Icons.person, key: NotasFiscalesAppKeys.magazinesTab),
    TabItem(title: "Mis Compras", icon: Icons.menu, key: NotasFiscalesAppKeys.accountTab),
  ];
  static final String backendServer = 'http://apis.notasfiscales.com.mx/api/';
}

