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


const String getHighLightedDocs = """
  query {
        highlighteds(limit: 3) {
        id
        image
        title
        tag {
          name
          id
        }
      }
  }
""";

const String getSubjectDocs = """
  query {
        highlighteds(offset: 3,limit: 3) {
        id
        image
        title
        tag {
          name
          id
        }
      }
  }
""";
