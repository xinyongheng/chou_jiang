class QuestionBean {
  int? no;
  String? question;
  dynamic answer;
  bool? checked;

  QuestionBean({this.no, this.question, this.answer, this.checked});

  QuestionBean.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    question = json['question'];
    answer = json['answer'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['checked'] = this.checked;
    return data;
  }
}
