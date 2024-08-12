import 'package:flutter/material.dart';
import 'package:texi_website/utils/Colors.dart';
import '../component/DashboardComponent/DashboardServiceComponent.dart';
import '../component/DashboardComponent/DashBookingComponent.dart';
import '../component/DashboardComponent/DashChooseComponent.dart';
import '../component/DashboardComponent/DashDowloadComponent.dart';
import '../component/DashboardComponent/DashFooterComponent.dart';
import '../component/DashboardComponent/DashHeaderComponent.dart';
import '../component/DashboardComponent/DashTestimonialComponent.dart';
import '../utils/Common.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashbord';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: primaryColor,
      backgroundColor: Colors.white,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1500));
        init();
        setState(() {});
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: DashHeaderComponent(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DashBookingComponent(),
              dividerImageWidget(),
              DashboardServiceComponent(),
              //DashChooseServiceComponent(),
              DashChooseComponent(),
              dividerImageWidget(),
              DashTestimonialComponent(),
              DashDowloadComponent(),
              DashFooterComponent()
            ],
          ),
        ),
      ),
    );
  }
}
