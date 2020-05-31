import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/store/user.dart';

import 'main_view_model.dart';

class MainView extends MainViewModel {
  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<User>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Öne Çıkanlar",
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                          onTap: () => {},
                          child: Text(
                            "Tümünü Gör",
                            style: TextStyle(color: Theme.of(context).primaryColorDark.withOpacity(0.5)),
                          ))
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: CachedNetworkImage(
                                      imageUrl:'https://pbs.twimg.com/profile_images/1054800233908047872/cqOL6E_u_bigger.jpg',
                                      placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                                      imageBuilder: (context, image) => ClipRRect(
                                        child: Image(image: image,width: 170,fit: BoxFit.cover,),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                      ),
                                    )
                                    /*ClipRRect(
                                      child: Image.network(
                                        "https://pbs.twimg.com/profile_images/1054800233908047872/cqOL6E_u_bigger.jpg",
                                        fit: BoxFit.cover,
                                        width: 170,
                                      ),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                    ),*/
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Container(
                                            width: 160,
                                            child: Wrap(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.blue.withOpacity(0.2)),
                                                  child: Text(
                                                    "YDS",
                                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 13),
                                                  ),
                                                  padding: EdgeInsets.only(top: 2, bottom: 4, left: 10, right: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Text("Haftanın En iyi Soruları ile beraber"),
                                            width: 160,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Konu Anlatımı",
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                          onTap: () => {},
                          child: Text(
                            "Tümünü Gör",
                            style: TextStyle(color: Theme.of(context).primaryColorDark.withOpacity(0.5)),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: ClipRRect(
                                      child: Image.network(
                                        "https://pbs.twimg.com/profile_images/1054800233908047872/cqOL6E_u_bigger.jpg",
                                        fit: BoxFit.cover,
                                        width: 170,
                                      ),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.blue.withOpacity(0.2)),
                                            child: Text(
                                              "YDS",
                                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 13),
                                            ),
                                            padding: EdgeInsets.only(top: 2, bottom: 4, left: 10, right: 10),
                                          ),
                                          Container(
                                            child: Text("Haftanın En iyi Soruları ile beraber"),
                                            width: 160,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dersler",
                        style: TextStyle(fontSize: 25),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: lessonList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                lessonList[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
