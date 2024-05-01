import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tools/constants.dart';
import '../view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text("E-COMMERCE ADMİN PANEL"),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_buildFirstCardItem(context), _buildSecondCardItem(context)],
      ),
    );
  }

  Widget _buildFirstCardItem(BuildContext context) {
    HomePageViewModel viewModel = Provider.of<HomePageViewModel>(context,listen: false);
    return GestureDetector(
      onTap: (){
        viewModel.goUsersPage(context: context);
      },
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(

          elevation: 5,
          shadowColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.person_pin_outlined,
                size: 80,
              ),
              Text(
                "Kullanıcı Sayısı",
                style: Constants.getBoldStyle(fontSize: 18),
              ),
              Consumer<HomePageViewModel>(
                builder: (context, value, child) {
                  debugPrint("chip1 consumer çalıştı");

                  return Chip(label: Text(value.userCount.toString(),style: Constants.getBoldStyle(fontSize: 20),));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondCardItem(BuildContext context) {
    HomePageViewModel viewModel = Provider.of<HomePageViewModel>(context,listen: false);

    return GestureDetector(
      onTap: (){
        viewModel.goCategoriesPage(context: context);
      },
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          elevation: 5,
          shadowColor: Colors.white,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.category_outlined,
                size: 80,
              ),
              Text(
                "Kategori Sayısı",
                style: Constants.getBoldStyle(fontSize: 18),
              ),
              Consumer<HomePageViewModel>(
                builder: (context, value, child) {
                  debugPrint("chip2  consumer çalıştı");

                  return Chip(label: Text(value.categoryCount.toString(),style: Constants.getBoldStyle(fontSize: 20),));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
