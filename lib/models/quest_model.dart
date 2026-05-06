class QuestModel {
  final String id;
  final String title;
  final String rank;
  final String reward;
  final String image;
  final String description;
  bool isTaken;

  QuestModel({
    required this.id,
    required this.title,
    required this.rank,
    required this.reward,
    required this.image,
    required this.description,
    this.isTaken = false,
  });
}
