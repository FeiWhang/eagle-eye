import 'package:eagle_eye/layouts/desktop/extensions/translate_on_hover.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

extension HoverExtensions on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // Widget the using the extension on
      onHover: (event) => appContainer.style.cursor = 'pointer',
      onExit: (event) => appContainer.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover {
    return TranslareOnHover(
      child: this,
    );
  }
}
