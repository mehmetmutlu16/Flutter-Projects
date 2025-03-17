import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'menu.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
}) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
        child: Row(
          children: List.generate(
            demoCategoryMenus.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: 8),
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  foregroundColor: widget.selectedIndex == index
                      ? Colors.black
                      : Colors.black45),
                child: Text(
                  demoCategoryMenus[index].category,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
