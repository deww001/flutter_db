class Transactions {
  String title;
  String content;
  String tpye;
  late int? id;

  Transactions(
      {this.id,
      required this.title,
      required this.content,
      required this.tpye});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
