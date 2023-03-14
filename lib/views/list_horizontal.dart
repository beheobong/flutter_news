import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal(
      {Key? key, this.icon, required this.list, this.isNews = true})
      : super(key: key);
  final String? icon;
  final List? list;
  final bool isNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list?.length ?? 0,
        itemBuilder: (context, index) {
          return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: Container(
              width: 260,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: AppStyle.greyE9)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      list![index].imgUrl!))),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          list![index].content ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        isNews
                            ? const SizedBox.shrink()
                            : Row(children: [
                                const Icon(Icons.timer),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('${list![index].minute.toString()} phút')
                              ]),
                        const SizedBox(height: 8),
                        isNews
                            ? const SizedBox.shrink()
                            : Text(list![index].subContent ?? '')
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          color: const Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(image: AssetImage(icon!))),
                    ),
                  ),
                  isNews
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 103,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: list![index].color!,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Text(list![index].banner ?? '',
                                style: const TextStyle(
                                    color: Color(0XFFFFFFFF), fontSize: 12)),
                          ))
                      : const SizedBox.shrink()
                ],
              ),
            ),
          );
        });
  }
}
