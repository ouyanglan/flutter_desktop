import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading {
  static OverlayEntry show(BuildContext context) {
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {//SafeArea
      return Container(
        color: Colors.black26,
        child: Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
    Overlay.of(context).insert(overlayEntry);
    return overlayEntry;
  }
}
