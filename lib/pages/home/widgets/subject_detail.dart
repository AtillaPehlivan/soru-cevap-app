import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sorucevap/service/graphql/docs/queries.dart';
import 'package:sorucevap/service/graphql/hasura.dart';

class SubjectDetail extends StatefulWidget {
  final title;
  final subjectId;

  const SubjectDetail({Key key, @required this.title,@required this.subjectId}) : super(key: key);

  @override
  _SubjectDetailState createState() => _SubjectDetailState();
}

class _SubjectDetailState extends State<SubjectDetail> {


  Future<String> getHtmlData() async {
    var subject = await HasuraService.instance.connection.query(getSubjectById, variables: {"id": widget.subjectId});
    print("called getSubjectById");
    return subject['data']['subjects_by_pk']['content'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getHtmlData(),
          initialData: null,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return HtmlWidget(snapShot.data, webView: true);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
