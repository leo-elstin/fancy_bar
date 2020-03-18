library fancy_bar;

import 'package:flutter/material.dart';

enum FancyType { FancyV1, FancyV2 }

class FancyBottomBar extends StatefulWidget {
  final List<FancyItem> items;
  final selectedIndex;
  final ValueChanged<int> onItemSelected;
  final FancyType type;

  FancyBottomBar({
    this.items,
    this.selectedIndex,
    @required this.onItemSelected,
    this.type,
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
                type: widget?.type,
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
  final FancyType type;

  const _ItemVWidget(
      {Key key, this.item, this.isSelected, this.length, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FancyType.FancyV1:
        {
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
                    color:
                    item.textColor ?? Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
                  : item.icon,
            ),
          );
        }

      case FancyType.FancyV2:
        {
          return Container(
            width: MediaQuery.of(context).size.width / length,
            height: kBottomNavigationBarHeight,
            child: AnimatedContainer(
              height: 0,
              color: Colors.white,
              duration: Duration(milliseconds: 300),
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: item.icon,
                  ),
                  AnimatedContainer(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? item.textColor : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    duration: Duration(milliseconds: 300),
                    height: isSelected ? kToolbarHeight : 24,
                    child: Text(
                      '${item.title}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      default:
        {
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
                    color:
                    item.textColor ?? Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
                  : item.icon,
            ),
          );
        }
    }
  }
}

class FancyItem {
  Color textColor;
  String title;
  Widget icon;
  FancyType type;

  FancyItem({
    @required this.textColor,
    @required this.title,
    @required this.icon,
    this.type,
  });
}
