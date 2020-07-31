class Todo {
  int _id;
  String _content;

  Todo(this._id, this._content);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'content': _content};
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }
}
