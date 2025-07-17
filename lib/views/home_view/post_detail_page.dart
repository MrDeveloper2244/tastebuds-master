import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/views/home_view/home_friend_list.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyDraggableSheet(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text("Comment"),
                ),
                Positioned(right: 0, child: SvgPicture.asset(ImageAsset.canel)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(ImageAsset.Ellipse),
                  ),
                  title: Text(
                    "aprileeseam",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        "I have been here too",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Reply",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textfieldColor),
                      )
                    ],
                  ),
                  trailing: Icon(Icons.favorite_border_outlined),
                );
              },
              itemCount: 4,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(ImageAsset.Ellipse),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Add a comment",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: AppColors.textfieldColor),
                      suffix: Text(
                        "Replay",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600,color: AppColors.textfieldColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textfieldColor,
                        )
                      )
                      ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
