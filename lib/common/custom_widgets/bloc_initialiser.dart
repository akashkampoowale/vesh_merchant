
import 'package:flutter/material.dart';


class BlocInitialiser extends StatefulWidget {
  final Function(BuildContext) blocFunction;
  final Widget blocBuilder;

  const BlocInitialiser({
    Key? key,
    required this.blocBuilder,
    required this.blocFunction,
  }) : super(key: key);

  @override
  State<BlocInitialiser> createState() => _BlocInitialiserState();
}

class _BlocInitialiserState extends State<BlocInitialiser> {
  @override
  void initState() {
    super.initState();
    widget.blocFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.blocBuilder;
  }
}
