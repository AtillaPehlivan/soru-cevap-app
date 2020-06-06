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
        question {
          image
        }
      }
  }
""";

const String getHighLightedDocs = """
  query {
        highlighteds {
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
   subjects {
      id
      title
      tag_id
      tag {
        id
        name
      }
      image
    } 
  }
""";
