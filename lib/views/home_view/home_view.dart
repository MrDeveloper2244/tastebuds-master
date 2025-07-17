import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/views/home_view/home_search_view.dart';
import 'package:world_countries/world_countries.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget _service_btn(String image, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(image),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(
              color: const Color.fromARGB(255, 210, 209, 209), width: 1),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                child: Row(
                  children: [
                    Text(
                      "Seoul",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
                width: 100,
              ),
              trailing: SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 85,
                    ),
                    InkWell(
                        child: SvgPicture.asset(
                      'assets/icons/Search.svg',
                      width: 24,
                      height: 24,
                    ),
                    onTap: () {
                      Get.to(HomeSearchView());
                    },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset(
                      'assets/icons/notification.svg',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
                width: 150,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _service_btn("assets/icons/buds.svg", 'Buds'),
                  _service_btn("assets/icons/resturant.svg", 'Resturant'),
                  _service_btn("assets/icons/cafe.svg", 'Cafe'),
                  _service_btn("assets/icons/bakery.svg", 'Bakery')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
