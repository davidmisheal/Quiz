class Question {
  String quesText = "";
  String quesImage = "";
  bool quesAns = true;

  Question({required String text, required String img, required bool ans}) {
    quesText = text;
    quesImage = img;
    quesAns = ans;
  }
}
