import 'package:flutter/material.dart';
import 'package:proj_estudos2/pages/home_page.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (idx) {
        if (idx == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        }
      },
      currentIndex: 0,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Download',
          icon: Icon(
            Icons.download,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
