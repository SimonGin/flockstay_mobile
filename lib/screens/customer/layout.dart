import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flockstay_mobile/screens/customer/home/scr.dart';
import 'package:flockstay_mobile/screens/customer/notifications/scr.dart';
import 'package:flockstay_mobile/screens/customer/profile/scr.dart';
import 'package:flockstay_mobile/screens/customer/reservations/scr.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerLayout extends StatefulWidget {
  final Widget childBody;
  final String currentScreen;

  const CustomerLayout(
      {super.key, required this.childBody, required this.currentScreen});

  @override
  State<CustomerLayout> createState() => _CustomerLayoutState();
}

class _CustomerLayoutState extends State<CustomerLayout> {
  late PageController _pageController;
  int _currentIndex = 0;

  final List<String> _routes = [
    "/home",
    "/reservations",
    "/notifications",
    "/profile",
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = _routes.indexOf(widget.currentScreen);
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void didUpdateWidget(CustomerLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newIndex = _routes.indexOf(widget.currentScreen);
    if (newIndex != _currentIndex) {
      _currentIndex = newIndex;
      _pageController
          .jumpToPage(_currentIndex); // Ensure the PageView is synchronized
    }
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      context.go(_routes[index]);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          context.go(_routes[index]); // Update URL on swipe
        },
        children: const [
          HomeScreen(),
          ReservationsScreen(),
          NotificationsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              color: Colors.cyan.withOpacity(0.38),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(0, Icons.home),
            _buildBottomNavItem(1, Icons.list),
            _buildBottomNavItem(2, Icons.notifications),
            _buildBottomNavItem(3, Icons.person),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon) {
    return IconButton(
      onPressed: () => _onItemTapped(index),
      icon: Icon(
        icon,
        size: 30,
        color: _currentIndex == index ? flockCyan : Colors.black,
      ),
    );
  }
}
