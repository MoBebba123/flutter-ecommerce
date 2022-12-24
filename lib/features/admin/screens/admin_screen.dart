import 'package:badges/badges.dart';
import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/features/account/screens/account_screen.dart';
import 'package:ecommerce/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWith = 42;
  double bottomBarBorderWith = 5;
  List<Widget> pages = [
    const Center(
      child: Text("post page"),
    ),
    const Center(
      child: Text("analytics page"),
    ),
    const Center(
      child: Text("orders page"),
    ),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Admin",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: updatePage,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWith,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWith,
                  ),
                ),
              ),
              child: const Icon(Icons.analytics_outlined),
            ),
            label: "analytics",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWith,
                  ),
                ),
              ),
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: "Orders",
          ),
        ],
      ),
    );
  }
}
