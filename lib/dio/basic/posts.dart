class Posts{
  int id;
  String title;
  final String error;
  Posts({this.id, this.title,this.error});
  Posts.fromJson(Map<String,dynamic > json)
  : id = json['id'],
  title = json['title'],
  error='';
  Posts.error(String errorValue)
      : id = null,
      title = '',
      error = errorValue;
}