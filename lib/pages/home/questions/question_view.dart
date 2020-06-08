import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/model/user/question/question.dart';
import 'package:sorucevap/store/user.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import 'question_view_model.dart';

class QuestionView extends QuestionViewModel {
  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<User>(context);

    return Scaffold(
        body: RefreshIndicator(
      strokeWidth: 3,
      onRefresh: handleRefreshIndicator,
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Observer(builder: (context) {
            if (userStore.askedQuestions.isEmpty) {
              userStore.loadUserAskedQuestions();
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(

                  itemCount: userStore.askedQuestions.length,
                  itemBuilder: (context, index) {
                    Color statusColor =
                        userStore.askedQuestions[index].status.toString() == "Cevaplandı" ? Colors.green : Theme.of(context).primaryColor;
                    return InkWell(
                      onTap: ()=>{},
                      child: ListTile(

                        title: Text(userStore.askedQuestions[index].title.toString()),
                        subtitle: Text(userStore.askedQuestions[index].tag.name),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(timeAgo.format(userStore.askedQuestions[index].date, locale: 'tr')),
                            Container(
                                decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  userStore.askedQuestions[index].status.toString(),
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                        leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image(
                              image: Image.network(userStore.askedQuestions[index].image).image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                      : null,
                                );
                              },
                            )),
                      ),
                    );
                  });
            }
          })),
    ));
  }

  Widget emptyWidget() {
    return Column(
      children: <Widget>[Spacer(), Text("data"), Spacer()],
    );
  }
}
