import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/model/user/question/question.dart';
import 'package:sorucevap/store/user.dart';

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
                    return ListTile(
                      title: Text(userStore.askedQuestions[index].title.toString()),
                      subtitle: Text(userStore.askedQuestions[index].tag.name),
                      trailing: Column(
                        children: <Widget>[
                          Text(userStore.askedQuestions[index].date.hour.toString() + ":" + userStore.askedQuestions[index].date.minute.toString()),
                          Container(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              userStore.askedQuestions[index].status.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                      leading: Image(image: Image.network("https://pbs.twimg.com/profile_images/1054800233908047872/cqOL6E_u_bigger.jpg").image),
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
