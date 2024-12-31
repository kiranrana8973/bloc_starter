import 'package:bloc_test/model/student_model.dart';
import 'package:equatable/equatable.dart';

class StudentState extends Equatable {
  final List<StudentModel> students;
  final bool isLoading;
  final String? error;

  const StudentState({
    required this.students,
    required this.isLoading,
    this.error,
  });

  factory StudentState.initial() {
    return const StudentState(
      students: [],
      isLoading: false,
      error: null,
    );
  }

  StudentState copyWith({
    List<StudentModel>? students,
    bool? isLoading,
    String? error,
  }) {
    return StudentState(
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [students, isLoading, error];
}
