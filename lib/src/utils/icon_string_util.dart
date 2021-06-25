import 'package:components/theme.dart';
import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert_outlined,
  'accessibility': Icons.accessibility_outlined,
  'folder_open': Icons.folder_open_outlined,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

Icon getIcon(String nameIcon) {
  return Icon(_icons[nameIcon], color: AppTheme.greenColor4);
}
