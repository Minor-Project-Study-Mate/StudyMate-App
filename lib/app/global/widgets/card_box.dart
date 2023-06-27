// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const trigger = 700.0;

class CardBox extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const CardBox(
      {Key? key, required this.child, this.padding, required double elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Center(
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.bounceInOut,
              height: constraints.maxWidth > trigger
                  ? 600
                  : MediaQuery.of(context).size.height,
              width: constraints.maxWidth > trigger
                  ? 500
                  : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    constraints.maxWidth > trigger ? 20 : 0),
                color: Theme.of(context).colorScheme.surface,
                boxShadow: constraints.maxWidth > trigger
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
                child: child,
              )),
        ),
      );
}
