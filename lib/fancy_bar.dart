library fancy_bar;

import 'package:flutter/material.dart';

class FancyBottomBar extends StatefulWidget {
  final List<FancyItem> items;
  final selectedIndex;
  final ValueChanged<int> onItemSelected;

  FancyBottomBar({
    this.items,
    this.selectedIndex,
    @required this.onItemSelected,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 4);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomBarState createState() => _FancyBottomBarState();
}

class _FancyBottomBarState extends State<FancyBottomBar> {
  int pos = 0;

  void setItem(int _pos) {
    setState(() {
      pos = _pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BottomAppBar(
//        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.items.map((_item) {
            FancyItem item = _item;
            var index = widget.items.indexOf(_item);
            return InkWell(
              onTap: () {
                setItem(index);
                widget.onItemSelected(index);
              },
              child: _ItemVWidget(
                item: item,
                isSelected: index == pos,
                length: widget.items.length,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ItemVWidget extends StatelessWidget {
  final FancyItem item;
  final bool isSelected;
  final int length;

  const _ItemVWidget({Key key, this.item, this.isSelected, this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / length,
        height: kBottomNavigationBarHeight,
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          duration: Duration(milliseconds: 250),
          child: isSelected
              ? Text(
                  '${item.title}',
                  style: TextStyle(
                      color: item.textColor ?? Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              : item.icon,
        ));
  }
}

class FancyItem {
  Color textColor;
  String title;
  Widget icon;

  FancyItem({
    @required this.textColor,
    @required this.title,
    @required this.icon,
  });
}
