
import 'package:flutter/widgets.dart';

class NotasFiscalesAppKeys {
  // Home Screens
  // Tabs
  static const tabs = Key('__tabs__');
  static const newsTab = Key('__newsTab__');
  static const booksTab = Key('__booksTab__');
  static const magazinesTab = Key('__magazinesTab__');
  static const accountTab = Key('__accountTab__');

  static final newsItem = (int id) => Key('NewsItem__$id');
  static final booksItem = (int id) => Key('BooksItem_$id');
  static final magazinesItem = (int id) => Key('MagazinesItem__$id');
}