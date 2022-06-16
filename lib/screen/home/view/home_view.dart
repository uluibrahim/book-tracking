import 'package:book_tracking/screen/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../booklist/book_list.dart';
import '../../reading_list/reading_list.dart';
import '../tab_items.dart';

class HomeView extends StatelessWidget with TabItems {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<HomeViewmodel>(context);
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        bottomNavigationBar: TabBar(tabs: myTabs),
        body: TabBarView(
          children: [
            BookList(viewmodel),
            ReadingList(viewmodel),
          ],
        ),
      ),
    );
  }
}
