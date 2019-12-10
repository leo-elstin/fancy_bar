![Pub](https://img.shields.io/pub/v/fancy_bar)

# FancyBar

A fancy yet beautiful animated widget for your Flutter apps

| Preview |
|---------|----------|
|![FancyBar Gif](https://raw.githubusercontent.com/leoelstin/Flutter-UI-Kits/master/images/ezgif.com-crop.gif) |

## Customization (Optional)

### FancyBar

`items` - navigation items, required more than one item and less than six<br/>
`selectedIndex` - the current item index. Use this to change the selected item. Default to zero<br/>
`onItemSelected` - required to listen when a item is tapped it provide the selected item's index<br/>


### FancyItem
`icon` - the widget of this item. Your can pass any widget as param.<br/>
`title` - the text that will appear next to the icon when this item is selected.<br/>
`textColor` - the active item's  text color<br/>

## Getting Started

Add the plugin:

```yaml
dependencies:
  fancy_bar: ^1.0.0
```

## Basic Usage

Adding the widget

```dart
bottomNavigationBar: FancyBottomBar(
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

