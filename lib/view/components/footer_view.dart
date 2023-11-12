import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterView extends StatefulWidget {
  final Widget child;
  final double minHeight;
  final bool visibility;
  const FooterView(
      {Key? key,
      required this.child,
      this.minHeight = 0.65,
      this.visibility = true})
      : super(key: key);

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.7),
        child: Align(alignment: Alignment.topCenter, child: widget.child),
      ),
    ]);
  }
}
