import 'package:flutter/material.dart';
import 'package:kawika_machinetest/app/modules/login/view_model/login_provider.dart';
import 'package:kawika_machinetest/utils/common_widgets.dart';
import 'package:provider/provider.dart';

import '../../login/view_model/bottom_navigation.dart';
import '../../profille/view/profile_page.dart';
import '../view_model/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonTextWidget(
            color: Colors.black,
            text: 'List',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          Consumer<HomeProvider>(builder: (context, obj, _) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: obj.listDatas.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CommonTextWidget(
                            color: Colors.black,
                            text: obj.listDatas[index].name ?? '',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          CommonTextWidget(
                            color: Colors.black,
                            text: obj.listDatas[index].email ?? '',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      CommonTextWidget(
                        color: Colors.black,
                        text: obj.listDatas[index].body ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        maxLines: 3,
                        overFlow: TextOverflow.ellipsis,
                        align: TextAlign.start,
                      )
                    ],
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }

  @override
  void initState() {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    super.initState();
    homeProvider.getHomeData();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Consumer<LoginProvider>(builder: (context, obj, _) {
              return InkWell(
                onTap: () {
                  obj.logout(context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.logout_outlined,
                    size: 30,
                  ),
                ),
              );
            })
          ],
          title: CommonTextWidget(
            color: Colors.black,
            text: 'Hai',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Consumer<BottomNavigationBarProvider>(builder: (context, obj, _) {
          return obj.currentIndex == 0 ? ProfilePage() : HomePageBody();
        }),
        bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
              ],
            );
          },
        ));
  }
}
