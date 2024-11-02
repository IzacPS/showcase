## Showcase
Showcase é um pacote Flutter que permite a criação de stories semelhantes aos do Instagram.
## Features
Navegação entre stories.
Reprodução automática com indicadores de progresso.

## Usage
O Showcase tem a seguinte configuração:
```dart  
Showcase({
  Key? key,
  required List<ShowcaseItem<B, E, EV>> items,
  required BubbleConfig<B> bubbleConfig,
  required EntityConfig<E, EV> entityConfig,
})
```

Onde items é uma lista do modelo *ShowcaseItem* que tem a seguinte estrutura: 
```dart  
ShowcaseItem({
  required B bubbleItem, 
  required EntityItem<E, EV> entityItem
    
})

EntityItem({
  required E item, 
  required List<EV> entityViewItems
})
```
Alem da lista de items é preciso passar informações sobre as configurações
das bolhas (bubbleConfig) e das entidades (entityConfig).
```dart  
BubbleConfig({
  required Color Function(BuildContext, int, B) statusBuilder,
  required DecorationImage? Function(BuildContext, int, B) avatarBuilder,
  required Widget Function(BuildContext, int, B) descriptionBuilder,
  Widget Function(BuildContext)? emptyListFallbackBuilder,
  double size = 92,
  double height = 54,
})

EntityConfig({
  required Widget Function(BuildContext, int, EV) entityViewItemBuilder,
  Widget Function(BuildContext, int, E)? entityItemBuilder,
  Duration viewDuration = const Duration(seconds: 5),
})
```
Um caso de uso pode ser encontrado no diretório `/example`.

![](./assets/video2.gif)
![](./assets/video3.gif)
