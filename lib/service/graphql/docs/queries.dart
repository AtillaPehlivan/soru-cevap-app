const String getUserAskedQuestionsDoc = """
  query {
      user_question {
        detail
        has_answer
        id
        image
        question_id
        receiver_user_id
        sender_user_id
        status
        tag_id
        title
        date
        tag {
          name
        }
    }
  }
""";
