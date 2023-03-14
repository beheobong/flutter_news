// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:care_box/helpers/app_style.dart';
// import 'package:care_box/pages/home/home_news_model.dart';
// import 'package:dudv_base/dudv_base.dart';
// import 'package:flutter/material.dart';

// class ItemHomeView extends StatelessWidget {
//   const ItemHomeView({
//     Key? key,
//     required this.model,
//     required this.onTap,
//   }) : super(key: key);

//   final HomeNewsModel model;
//   final ValueChanged<HomeNewsModel> onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//       child: GestureDetector(
//         onTap: () => onTap(model),
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.grey[350],
//                 child: Image(
//                   image: CachedNetworkImageProvider(model.img ?? ''),
//                   fit: BoxFit.fill,
//                   height: 200,
//                   width: double.infinity,
//                 ),
//               ),
//               Text(
//                 model.titleShow,
//                 style: Styles.copyStyle(
//                     color: AppStyle.textBody, fontWeight: FontWeight.w500),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
