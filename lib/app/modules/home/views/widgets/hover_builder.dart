import 'package:flutter/material.dart';

class HoverBuilder extends StatefulWidget {
  const HoverBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget? Function(BuildContext context, bool isHovering) builder;

  @override
  State<HoverBuilder> createState() => _MyListTileState();
}

class _MyListTileState extends State<HoverBuilder> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) => setState(() => isHovering = true),
        onExit: (event) => setState(() => isHovering = false),
        child: widget.builder(context, isHovering),
      );
}
