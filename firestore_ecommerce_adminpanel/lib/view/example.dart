import 'package:flutter/material.dart';



class MyExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Popup Menu Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showAnimatedMenu(context);
            },
            child: Text('Show Animated Popup Menu'),
          ),
        ),
      ),
    );
  }

  void showAnimatedMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    Navigator.of(context).push(
      _PopupMenuRoute(
        position: position,
        items: [
          PopupMenuItem(
            child: ListTile(
              title: Text('Option 1'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text('Option 2'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text('Option 3'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopupMenuRoute<T> extends PopupRoute<T> {
  _PopupMenuRoute({
    required this.position,
    required this.items,
  });

  final RelativeRect position;
  final List<PopupMenuItem<T>> items;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.transparent,
        child: CustomSingleChildLayout(
          delegate: _PopupMenuRouteLayout(position),
          child: FadeTransition(
            opacity: animation,
            child: Card(
              child: ListView(
                shrinkWrap: true,
                children: items,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);
}

class _PopupMenuRouteLayout extends SingleChildLayoutDelegate {
  _PopupMenuRouteLayout(this.position);

  final RelativeRect position;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(position.left, position.top);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
