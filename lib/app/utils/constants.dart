import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_project/app/modules/cart/views/cart_view.dart';
import 'package:firebase_project/app/modules/categories/views/categories_view.dart';
import 'package:firebase_project/app/modules/home/views/home_view.dart';
import 'package:firebase_project/app/modules/profile/views/profile_view.dart';
import 'package:firebase_project/app/modules/wishlist/views/wishlist_view.dart';
import 'package:flutter/material.dart';

class Constants {
  static const tabItemList = [
    TabItem(icon: Icons.home),
    TabItem(icon: Icons.category_outlined),
    TabItem(icon: Icons.shopping_cart),
    TabItem(icon: Icons.favorite),
    TabItem(icon: Icons.person),
  ];

  static const screens = [
    HomeView(),
    CategoriesView(),
    CartView(),
    WishlistView(),
    ProfileView(),
  ];
  static const screensHeader = [
    'Home',
    'Categories',
    'Cart',
    'Wishlist',
    'Profile',
  ];
}
