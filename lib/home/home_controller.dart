import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void init() async {
    state = HomeState.loading;
    this.user = await repository.getUser();
    this.quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
