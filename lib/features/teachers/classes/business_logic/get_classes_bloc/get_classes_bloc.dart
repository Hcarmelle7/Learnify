import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mystudy/features/teachers/classes/data/models/classe_model.dart';
import 'package:mystudy/features/teachers/classes/data/repositories/class_repository.dart';

part 'get_classes_event.dart';
part 'get_classes_state.dart';

class GetClassesBloc extends Bloc<GetClassesEvent, GetClassesState> {
  final ClassRepository? repository;

  GetClassesBloc({this.repository}) : super(GetClassesInitial()) {
    on<GetAllClassesEvent>((event, emit) async {
      if (repository == null) return;
      emit(GetAllClassesLoading());
      try {
        final classes = await repository!.getAllClasses();
        emit(GetAllClassesSuccess(classes));
      } catch (e) {
        emit(GetAllClassesFailure(e.toString()));
      }
    });
  }
}
