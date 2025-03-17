import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_menu/menu.dart';
import 'package:food_menu/menu_appbar.dart';
import 'package:food_menu/restaurant_info.dart';

import 'Categories.dart';
import 'menu_card.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          menuAppBar(),
          restaurant_info(),
          SliverToBoxAdapter(
            child: Categories(
              onChanged: (value) {},
              selectedIndex: 0,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, categoryIndex){
                    List<Menu> items = demoCategoryMenus[categoryIndex].items;
                    return MenuCategoryItem(
                      title: demoCategoryMenus[categoryIndex].category,
                      items: List.generate(
                        items.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: MenuCard(
                              title: items[index].title,
                              image: items[index].image,
                              price: items[index].price,
                            ),
                          )
                      ),
                    );
                  },
                childCount: demoCategoryMenus.length
              ),
            ),
          ),
        ],
      ),
    );
  }
}
