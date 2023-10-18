import 'package:example/cubit/tabs_box_cubit.dart';
import 'package:example/ui/cart/cart_screen.dart';
import 'package:example/ui/favorites/favorites_screen.dart';
import 'package:example/ui/home/home_screen.dart';
import 'package:example/ui/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({super.key});

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomeScreen());
    screens.add(const FavoritesScreen());
    screens.add(const CartScreen());
    screens.add(const NotificationScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.read<TabsBoxCubit>().state,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context.read<TabsBoxCubit>().setIndex(index),
        currentIndex: context.read<TabsBoxCubit>().state,
        selectedItemColor: const Color(0xFFC67C4E),
        unselectedItemColor: const Color(0xFF8D8D8D),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ''),
        ],
      ),
    );
  }
}
