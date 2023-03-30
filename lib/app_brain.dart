import 'questions.dart';

class App_brain {
  int _quesNum = 0;
  List<Question> _quesGp = [
    Question(
      text: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب",
      img: 'images/image-1.jpg',
      ans: true,
    ),
    Question(
      text: "القطط هي حيوانات لاحمة",
      img: 'images/image-2.jpg',
      ans: true,
    ),
    Question(
      text: "الصين تقع في قارة افريقيا",
      img: 'images/image-3.jpg',
      ans: false,
    ),
    Question(
      text: "الارض مسطحة",
      img: 'images/image-4.jpg',
      ans: false,
    ),
  ];
  String getQuesText() {
    return _quesGp[_quesNum].quesText;
  }

  String getQuesImg() {
    return _quesGp[_quesNum].quesImage;
  }

  bool getQuesAns() {
    return _quesGp[_quesNum].quesAns;
  }

  void nextQues() {
    if (_quesNum < _quesGp.length - 1) {
      _quesNum++;
    } else {
      _quesNum = 0;
    }
  }

  bool isFinished() {
    if (_quesNum >= _quesGp.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesNum = 0;
  }
}
