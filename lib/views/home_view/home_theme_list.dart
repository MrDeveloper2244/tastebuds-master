import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/views/home_view/home_friend_list.dart';

class HomeThemeList extends StatelessWidget {
  const HomeThemeList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> themes = [
      {'title': 'Theme Park', 'image': 'assets/icons/theme1.png'},
      {'title': 'Camp Site', 'image': 'assets/icons/theme2.png'},
      {'title': 'Theater', 'image': 'assets/icons/theme3.png'},
      {'title': 'Swimming Pool', 'image': 'assets/icons/theme4.png'},
      {'title': 'Cycling Route', 'image': 'assets/icons/theme5.png'},
      {'title': 'Forest Bathing', 'image': 'assets/icons/theme6.png'},
      {'title': 'Golf', 'image': 'assets/icons/theme7.png'},
    ];

    return Scaffold(
      body: MyDraggableSheet(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text(
                      "Theme",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset(
                      ImageAsset.canel, 
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: themes.length,
                  itemBuilder: (context, index) {
                    final item = themes[index];
                    return ListTile(
                      leading: Image.asset(
                        item['image']!,
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        height: 38,
                        width: 78,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor1,
                        ),
                        child: Text(
                          "View Map",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
