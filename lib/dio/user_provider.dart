
import 'package:rxdart/rxdart.dart';
import 'module/user_reponse.dart';
import 'user_repository.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject =
  BehaviorSubject<UserResponse>();

  getUser() async {
    UserResponse response = await _repository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;

}
final bloc = UserBloc();