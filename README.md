![Pub](https://img.shields.io/pub/v/fancy_bar)

# FancyBar

A fancy yet beautiful animated widget for your Flutter apps

| Preview Version 1 |
|---------|----------|
|![FancyBar Gif](https://raw.githubusercontent.com/leoelstin/Flutter-UI-Kits/master/images/ezgif.com-crop.gif) |

| Preview Version 2 |
|---------|----------|
|![FancyBar Gif](https://github.com/leoelstin/Flutter-UI-Kits/blob/master/images/fancy_bar_v2.gif?raw=true) |

## Customization (Optional)

### FancyBar

`items` - navigation items, required more than one item and less than six

`selectedIndex` - the current item index. Use this to change the selected item. Default to zero

`onItemSelected` - required to listen when a item is tapped it provide the selected item's index

`type` - You can pass the required Fancy Bar type. Available **FancyV1, FancyV2**



### FancyItem
`icon` - the widget of this item. Your can pass any widget as param.

`title` - the text that will appear next to the icon when this item is selected.

`textColor` - the active item's  text color

## Getting Started

Add the plugin:

```yaml
dependencies:
  fancy_bar: ^1.2.0
```

## Basic Usage

Adding the widget

```dart
bottomNavigationBar: FancyBottomBar(
        type: FancyType.FancyV2,   // Fancy Bar Type
        items: [
          FancyItem(
            textColor: Colors.orange,
            title: 'Home',
            icon: Icon(Icons.home),
          ),
          FancyItem(
            textColor: Colors.red,
            title: 'Trending',
            icon: Icon(Icons.trending_up),
          ),
          FancyItem(
            textColor: Colors.green,
            title: 'Search',
            icon: Icon(Icons.search),
          ),
          FancyItem(
            textColor: Colors.brown,
            title: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onItemSelected: (index) {
          print(index);
        },
      ),
```


Catch me up on **LinkedIn** @[Leo Elstin](https://www.linkedin.com/in/leoelstin/ "Leo Elstin")

💙 to Code👨🏽‍💻 Flutter Expert • Dart Kotlin Swift Node Js • Android • Full Stack Mobile Developer
