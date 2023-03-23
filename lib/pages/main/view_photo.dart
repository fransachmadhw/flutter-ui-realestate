import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhoto extends StatelessWidget {
  final String url;
  const ViewPhoto({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider: AssetImage(url),
      backgroundDecoration: BoxDecoration(color: dark500),
      minScale: 0.5,
      maxScale: 1.0,
      initialScale: 0.5,
    ));
  }
}
