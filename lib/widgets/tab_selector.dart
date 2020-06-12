import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/keys.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        key: NotasFiscalesAppKeys.tabs,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        items: Constants.tabs
            .map((TabItem item) => BottomNavigationBarItem(
                icon: Icon(
                  item.icon,
                  key: item.key,
                ),
                title: Text(item.title)))
            .toList());
  }
}
