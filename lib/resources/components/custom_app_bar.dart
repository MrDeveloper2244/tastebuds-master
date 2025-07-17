// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? titleText; // Optional text title
//   final String? actionText; // Optional text title

//   final String? titleImagePath; // Optional image logo
//   final String? leadingImagePath; // Optional custom back icon
//   final Color backgroundColor;

//   final double height;
//   final double leadingImgheight;
//   final double leadingImgwidth;
//   final bool showBack;
//   final VoidCallback? leadingOnTap;
//   final VoidCallback? titleOnTap;
//   final VoidCallback? actionOnTap;

//   const CustomAppBar({
//     Key? key,
//     this.titleText,
//     this.actionText = '',
//     this.titleImagePath,
//     this.leadingImagePath,
//     this.backgroundColor = Colors.white,
//     this.leadingImgheight = 20,
//     this.height = 56,
//     this.leadingImgwidth = 20,
//        this. leadingOnTap,
//        this.titleOnTap,
//        this.actionOnTap,

//     this.showBack = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: backgroundColor,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       // leading: showBack
//       //     ? GestureDetector(
//       //         onTap: () => Get.back(),
//       //         child: Padding(
//       //           padding: const EdgeInsets.all(12.0),
//       //           child: Image.asset(
//       //             leadingImagePath ?? 'assets/icons/back_arrow.png',
//       //             height: leadingImgheight,


//       //             width:leadingImgwidth,
//       //             // fit: BoxFit.contain,
//       //           ),
//       //         ),
//       //       )
//       //     : null,
      
//       leading: showBack
//     ? GestureDetector(
//         onTap: leadingOnTap,
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: SizedBox(
//             height: leadingImgheight,
//             width: leadingImgwidth,
//             child: Image.asset(
//               leadingImagePath ?? 'assets/icons/back_arrow.png',
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       )
//     : null,

//       centerTitle: true,
//       title: titleImagePath != null
//           ? GestureDetector(
//             onTap: actionOnTap,
//             child: Image.asset(
//                 titleImagePath!,
//                 height: 40,
//                 fit: BoxFit.contain,
//               ),
//           )
//           : titleText != null
//               ? Text(
//                   titleText!,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 )
//               : null,
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: GestureDetector(
//             onTap: actionOnTap,
//             child: Text(
//               '$actionText',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final String? actionText;
  final String? titleImagePath;
  final String? leadingImagePath;
  final Color backgroundColor;
  final double height;
  final double leadingImgHeight;
  final double leadingImgWidth;
  final bool showBack;
  final VoidCallback? leadingOnTap;
  final VoidCallback? titleOnTap;
  final VoidCallback? actionOnTap;
  final Color iconColor;

  const CustomAppBar({
    Key? key,
    this.titleText,
    this.actionText = '',
    this.titleImagePath,
    this.leadingImagePath,
    this.backgroundColor = Colors.white,
    this.leadingImgHeight = 24,
    this.height = kToolbarHeight,
    this.leadingImgWidth = 24,
    this.leadingOnTap,
    this.titleOnTap,
    this.actionOnTap,
    this.showBack = true,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBack
          ? _buildLeadingIcon()
          : null,
      centerTitle: true,
      title: _buildTitle(),
      actions: _buildActions(),
    );
  }

  Widget _buildLeadingIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: leadingImgWidth + 24, // Padding included
        height: leadingImgHeight + 24,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: leadingOnTap ?? () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  leadingImagePath ?? 'assets/icons/back_arrow.png',
                  width: leadingImgWidth,
                  height: leadingImgHeight,
                  color: iconColor,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildTitle() {
    if (titleImagePath != null) {
      return GestureDetector(
        onTap: titleOnTap,
        child: Image.asset(
          titleImagePath!,
          height: 40,
          fit: BoxFit.contain,
        ),
      );
    } else if (titleText != null) {
      return GestureDetector(
        onTap: titleOnTap,
        child: Text(
          titleText!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    return null;
  }

  List<Widget>? _buildActions() {
    if (actionText?.isNotEmpty ?? false) {
      return [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Center(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: actionOnTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    actionText!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(Get.context!).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ];
    }
    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}