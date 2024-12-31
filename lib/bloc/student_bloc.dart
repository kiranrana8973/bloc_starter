import 'package:bloc_test/bloc/student_event.dart';
import 'package:bloc_test/bloc/student_state.dart';
import 'package:bloc_test/model/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentState.initial()) {
    on<StudentAddEvent>(_onStudentAddEvent);
    on<StudentDeleteEvent>(_onStudentDeleteEvent);
  }

  Future<void> _onStudentAddEvent(
    StudentAddEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final students = List<StudentModel>.from(state.students)
      ..add(event.studentModel);
    emit(state.copyWith(students: students, isLoading: false));
  }

  Future<void> _onStudentDeleteEvent(
    StudentDeleteEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final students = List<StudentModel>.from(state.students)
      ..removeAt(event.index);
    emit(state.copyWith(students: students, isLoading: false));
  }
}
