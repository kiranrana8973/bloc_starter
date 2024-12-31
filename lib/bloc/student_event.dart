import 'package:bloc_test/model/student_model.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class StudentEvent {}

class StudentAddEvent extends StudentEvent {
  final StudentModel studentModel;

  StudentAddEvent(this.studentModel);
}

class StudentDeleteEvent extends StudentEvent {
  final int index;

  StudentDeleteEvent(this.index);
}
