import 'models/models.dart';
import 'package:flutter/material.dart';
import 'package:notas_fiscales/keys.dart';

class Constants {
  static final List<TabItem> tabs = [
    TabItem(title: "Noticias", icon: Icons.home, key: NotasFiscalesAppKeys.newsTab),
    TabItem(title: "Libros", icon: Icons.book, key: NotasFiscalesAppKeys.booksTab),
    TabItem(title: "Revistas", icon: Icons.receipt, key: NotasFiscalesAppKeys.magazinesTab),
    TabItem(title: "Mis Compras", icon: Icons.menu, key: NotasFiscalesAppKeys.accountTab),
  ];
  static final String backendServer = 'http://apis.notasfiscales.com.mx/api';
  static final String urlBaseProductos = 'https://notasfiscales.com.mx/producto/';
  static final String imgNotFound = "https://cdn.browshot.com/static/images/not-found.png";
}