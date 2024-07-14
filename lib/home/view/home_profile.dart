import 'package:employee_list/home/controller/home_controller.dart';
import 'package:employee_list/utils/const/colors.dart';
import 'package:employee_list/utils/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../profile/view/profile_screen.dart';
import '../widget/gridview_custom_widget.dart';

class HomeProfileScreen extends StatefulWidget {
  const HomeProfileScreen({super.key});

  @override
  State<HomeProfileScreen> createState() => _HomeProfileScreenState();
}

class _HomeProfileScreenState extends State<HomeProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false).tabController =
        TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, controller, _) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              toolbarHeight: 26,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      AppColor.primaryCOlor,
                      Colors.transparent,
                    ])),
                //  GradientContainer(child: const SizedBox(),
              ),
              leading: const SizedBox(),
              bottom: TabBar(controller: controller.tabController, tabs: [
                Tab(
                    child: Text(
                  "Employe List",
                  style: AppText.h2BlackPassione,
                )),
                Tab(
                    child: Text(
                  "Detailed View ",
                  style: AppText.h2BlackPassione,
                )),
              ])),
          body: TabBarView(
            children: [
              GridviewWidget(),
              ProfileScreen(),
            ],
            controller: controller.tabController,
          ),
        ),
      );
    });
  }
}
