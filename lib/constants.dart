import 'models/models.dart';
import 'package:flutter/material.dart';
import 'package:notas_fiscales/keys.dart';

class Constants {
  static final List<TabItem> tabs = [
    TabItem(title: "Settings", icon: Icons.person, key: NotasFiscalesAppKeys.settingsTab),
    TabItem(title: "Home", icon: Icons.person, key: NotasFiscalesAppKeys.homeTab),
    TabItem(title: "Messages", icon: Icons.person, key: NotasFiscalesAppKeys.messagesTab),
  ];
  static final String backendServer = 'http://apis.notasfiscales.com.mx/api/';
}

