import 'package:final_note/config/config.dart';
import 'package:final_note/tabs/tab0.dart';
import 'package:final_note/tabs/tab1.dart';
import 'package:final_note/utils/app_name.dart';
import 'package:final_note/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:get/get.dart';

//! Silver App Bar With Tab0 & Tab1 !\\

class MyNotePage extends StatefulWidget {
  const MyNotePage({Key? key}) : super(key: key);

  @override
  _MyNotePageState createState() => _MyNotePageState();
}

class _MyNotePageState extends State<MyNotePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;

  final List<Tab> _tabs = [
    Tab(
      text: Config().initialCategories[0],
    ),
    Tab(
      text: Config().initialCategories[1],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      //extendBody: true,
      //extendBodyBehindAppBar: true,
      drawer: const DrawerMenu(),
      
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.grey[100],
              
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 0,
              title: const AppName(fontSize: 19.0),
              leading: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Image.asset('assets/images/menu.png'),
              ),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                labelStyle: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blueAccent,
                //labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: const Color(0xff5f6368),
                isScrollable: true,
                indicator: MD2Indicator(
                  indicatorHeight: 3,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorSize: MD2IndicatorSize.normal,
                ),
                tabs: _tabs,
              ),
            ),
          ];
        },
        body: Builder(builder: (BuildContext context) {
          //final innerScrollController = PrimaryScrollController.of(context);
          return TabBarView(
            
            controller: _tabController,
            children: const [Tab0(), Tab1()],
          );
        }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
