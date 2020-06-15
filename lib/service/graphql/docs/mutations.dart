const String addUserQuestion="""

mutation insert_user_question(\$image:String!,\$detail:String!) {
  insert_user_question(objects: {image: \$image, title: \$detail, status: "Bekliyor", sender_user_id: 18}) {
    affected_rows
  }
}

""";