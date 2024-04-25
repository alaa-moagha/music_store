import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/main_view/cart_view/cart_view.dart';
import 'package:music_store/ui/views/main_view/search_view/search_view.dart';
import '../../../core/enums/bottom_navigation.dart';
import 'home_view/home_view.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  MainView({
    Key? key,
    required this.pageNumber,
    required this.selectedItem,
  }) : super(key: key);
  final int pageNumber;
  final BottomNavigationEnum selectedItem;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late BottomNavigationEnum selected;
  late PageController controller; // Declare controller here

  // PageController controller = PageController(initialPage: 1);

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    controller =
        PageController(initialPage: widget.pageNumber); // Initialized here
    selected = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        bottomNavigationBar: BottomNavigationWidget(
          bottomNavigation: selected,
          onTap: (selectedItem, pageNumber) {
            setState(() {
              selected = selectedItem;
            });
            controller.animateToPage(
              pageNumber,
              duration: Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
            );
          },
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(30),
              start: screenWidth(30),
              end: screenWidth(30)),
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              SearchView(),
              HomeView(),
              CartView(),
            ],
          ),
        ),
      ),
    );
  }
}
