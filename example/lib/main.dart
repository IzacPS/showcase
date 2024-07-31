import 'package:flutter/material.dart';
import 'package:showcase/models/showcase_item.dart';
import 'package:showcase/showcase.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ShowcasePage(),
    );
  }
}

typedef BubbleData = ({String avatar, String name});
typedef EntityData = ({String profileName});

class ShowcasePage extends StatelessWidget {
  ShowcasePage({super.key});

  //definição da lista de items
  //cada bolha vai ter uma imagem para o avatar e um nome pra descrição
  //cada entidade terá um nome, e uma lista de views que são imagens dessa entidade (ou perfil)
  final List<ShowcaseItem<BubbleData, String, String>> data = [
    ShowcaseItem(
      bubbleItem: (
        avatar: "assets/profile/undraw_Female_avatar_efig.png",
        name: "maria"
      ),
      entityItem: EntityItem(
        item: "maria",
        entityViewItems: [
          "assets/posts/benjamin-davies-__U6tHlaapI-unsplash.jpg",
          "assets/posts/brent-cox-lRM-J3q2Z3k-unsplash.jpg",
        ],
      ),
    ),
    ShowcaseItem(
      bubbleItem: (
        avatar: "assets/profile/undraw_Male_avatar_g98d.png",
        name: "peter"
      ),
      entityItem: EntityItem(item: "peter", entityViewItems: [
        "assets/posts/caleb-jones-3igHRe7QTdg-unsplash.jpg",
        "assets/posts/guille-pozzi-SHcHVFhz7-M-unsplash.jpg",
        "assets/posts/jake-blucker-tMzCrBkM99Y-unsplash.jpg",
        "assets/posts/james-donaldson-toPRrcyAIUY-unsplash.jpg",
      ]),
    ),
    ShowcaseItem(
      bubbleItem: (
        avatar: "assets/profile/undraw_Pic_profile_re_7g2h.png",
        name: "paul"
      ),
      entityItem: EntityItem(item: "paul", entityViewItems: [
        "assets/posts/joel-filipe-QwoNAhbmLLo-unsplash.jpg",
        "assets/posts/pexels-maxandrey-1366630.jpg",
        "assets/posts/pexels-todd-trapani-488382-1535162.jpg",
      ]),
    ),
    ShowcaseItem(
      bubbleItem: (
        avatar: "assets/profile/undraw_Profile_pic_re_iwgo.png",
        name: "juliet"
      ),
      entityItem: EntityItem(item: "juliet", entityViewItems: [
        "assets/posts/roland-larsson-8AceP6OOF3o-unsplash.jpg",
        "assets/posts/undraw_love_it_heart_dxlp.png",
        "assets/posts/undraw_undraw_application_ao1a_(1)_6anm.png",
      ]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Showcase<BubbleData, String, String>(
          items: data,
          entityConfig: EntityConfig(
            //define a duração das transições automáticas
            viewDuration: const Duration(seconds: 3),
            //define como será a view da entidade
            //nesse apenas uma imagem que vai cobrir preencher toda a view
            entityViewItemBuilder: (context, index, data) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
          //configuração das bolhas
          bubbleConfig: BubbleConfig(
            //builder para o avatar
            avatarBuilder: (context, index, data) {
              return DecorationImage(image: AssetImage(data.avatar));
            },
            //builder para a descrição do avatar
            descriptionBuilder: (context, index, data) {
              return Text(data.name);
            },
            //builder para indicar a cor do status
            statusBuilder: (context, index, data) {
              return Colors.orange;
            },
            //esse método é uma alternativa para caso items seja uma lista vazia
            emptyListFallbackBuilder: (context) => const Center(
              child: Text("No updates"),
            ),
          ),
        ),
      ),
    );
  }
}
