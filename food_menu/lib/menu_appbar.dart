import 'package:flutter/material.dart';

class menuAppBar extends StatelessWidget {
  const menuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: Colors.white,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('images/burger.jpg', fit: BoxFit.cover,),
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.share,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.search_sharp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
