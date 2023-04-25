class Question {
  final String question;
  final List<String> answers;
  const Question(this.question, this.answers);

  List<String> getShuffledAnswers(){
    final list = List.of(answers);
    list.shuffle();
    return list;
  }
}
