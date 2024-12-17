import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'catalog_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CatalogPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF1A6FEE),
        unselectedItemColor: Colors.grey,
        items: [
          _buildBottomNavItem('Главная', 'Home', 0),
          _buildBottomNavItem('Корзина', 'Cart', 1),
          _buildBottomNavItem('Профиль', 'user', 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(String label, String iconName, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        _selectedIndex == index
            ? 'assets/icons/${iconName}_select.svg'
            : 'assets/icons/$iconName.svg',
        width: 32,
        height: 32,
      ),
      label: label,
    );
  }
}