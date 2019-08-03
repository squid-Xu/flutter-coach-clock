import 'package:flutter/material.dart';

class RebuildLayout extends StatefulWidget {
  final WidgetBuilder builder;
  final RebuildLayoutController controller;

  RebuildLayout({Key key, @required this.builder, @required this.controller}) : super(key: key);

  @override
  _RebuildLayoutState createState() => _RebuildLayoutState();
}

class _RebuildLayoutState extends State<RebuildLayout> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_onRebuild);
  }

  @override
  void didUpdateWidget(RebuildLayout oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onRebuild);
      widget.controller.addListener(_onRebuild);
    }
  }

  @override
  void dispose() {
    widget.controller._listeners.clear();
    super.dispose();
  }

  _onRebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

class RebuildLayoutController extends Listenable {
  List<VoidCallback> _listeners = [];

  @override
  void addListener(listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    _listeners.remove(listener);
  }

  notification() {
    for(var listener in _listeners){
      listener();
    }
  }
}