class Menu{
  final String title, image;
  final double price;

  Menu({required this.title, required this.image, required this.price});
}

class CategoryMenu{
  final String category;
  final List<Menu> items;

  CategoryMenu({required this.category, required this.items});
}

final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu(
    category: "Most Popular",
    items: [
      Menu(
        title: "Medium Burger",
        image: "images/burger1.jpg",
        price: 6.0,
      ),
      Menu(
        title: "Beef & Lamb",
        image: "images/beef3.jpg",
        price: 10.5,
      ),
      Menu(
        title: "Strawberry & Watermelon",
        image: "images/drink2.jpg",
        price: 15.0,
      ),
    ],
  ),
  CategoryMenu(
    category: "Burgers",
    items: [
      Menu(
        title: "Medium Burger",
        image: "images/burger1.jpg",
        price: 6.0,
      ),
      Menu(
        title: "XL Burger",
        image: "images/burger2.jpeg",
        price: 7.5,
      ),
      Menu(
        title: "Children Menu",
        image: "images/burger3.jpg",
        price: 5.0,
      ),
    ],
  ),
  CategoryMenu(
    category: "Beef & Lamb",
    items: [
      Menu(
        title: "Beef",
        image: "images/beef1.jpg",
        price: 7.2,
      ),
      Menu(
        title: "Lamb",
        image: "images/beef2.jpg",
        price: 8.5,
      ),
      Menu(
        title: "Beef & Lamb",
        image: "images/beef3.jpg",
        price: 10.5,
      ),
    ],
  ),
  CategoryMenu(
    category: "Seafood",
    items: [
      Menu(
        title: "Salmon",
        image: "images/seafood1.jpg",
        price: 15.0,
      ),
      Menu(
        title: "Hamsi Tava",
        image: "images/seafood3.jpg",
        price: 7.5,
      ),
      Menu(
        title: "Seafood Menu",
        image: "images/seafood2.jpg",
        price: 12.7,
      ),
    ],
  ),
  CategoryMenu(
    category: "Drinks",
    items: [
      Menu(
        title: "Wine",
        image: "images/drink4.jpg",
        price: 25.0,
      ),
      Menu(
        title: "Cherry Juice",
        image: "images/drink3.jpg",
        price: 13.5,
      ),
      Menu(
        title: "Strawberry & Watermelon",
        image: "images/drink2.jpg",
        price: 15.0,
      ),
      Menu(
        title: "Green Coctail",
        image: "images/drink1.jpg",
        price: 10.0,
      ),
    ],
  ),
  CategoryMenu(
    category: "Desserts",
    items: [
      Menu(
        title: "Dessert 1",
        image: "images/dessert1.jpg",
        price: 9.9,
      ),
      Menu(
        title: "Strawberry Cake",
        image: "images/dessert2.jpg",
        price: 12.3,
      ),
      Menu(
        title: "Banana Cake",
        image: "images/dessert3.jpg",
        price: 8.3,
      ),
      Menu(
        title: "Ice Cream",
        image: "images/dessert4.png",
        price: 7.4,
      ),
    ],
  ),
];