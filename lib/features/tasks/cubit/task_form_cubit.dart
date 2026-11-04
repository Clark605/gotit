import 'package:gotit/core/cubit/base_cubit.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/features/tasks/cubit/task_form_state.dart';
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class TaskFormCubit extends BaseCubit<TaskFormState> {
  final TaskRepository _repository;
  static const _uuid = Uuid();
  List<ChecklistItemModel> _existingChecklist = [];

  TaskFormCubit(this._repository) : super(const TaskFormState());

  void reset() {
    _existingChecklist = [];
    emit(const TaskFormState());
  }

  void initializeForEdit(TaskModel task) {
    _existingChecklist = task.checklist;
    emit(
      state.copyWith(
        taskId: task.id,
        title: task.title,
        dueDate: task.dueDate,
        isAllDay: task.isAllDay,
        contextId: task.contextId,
        notes: task.notes,
        effortMinutes: task.effortMinutes,
        checklistDrafts: task.checklist.map((e) => e.content).toList(),
        titleError: null,
        status: LoadStatus.initial,
      ),
    );
  }

  void updateTitle(String title) {
    emit(
      state.copyWith(
        title: title,
        titleError: title.trim().isEmpty ? state.titleError : null,
      ),
    );
  }

  void updateDueDate(DateTime? date, {bool isAllDay = false}) {
    emit(state.copyWith(dueDate: date, isAllDay: isAllDay));
  }

  void updateContext(String? contextId) {
    emit(state.copyWith(contextId: contextId));
  }

  void updateNotes(String notes) {
    emit(state.copyWith(notes: notes));
  }

  void updateEffortMinutes(int? minutes) {
    emit(state.copyWith(effortMinutes: minutes));
  }

  void addChecklistItem(String content) {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return;
    emit(state.copyWith(checklistDrafts: [...state.checklistDrafts, trimmed]));
  }

  void removeChecklistItem(int index) {
    if (index < 0 || index >= state.checklistDrafts.length) return;
    final updated = List<String>.from(state.checklistDrafts)..removeAt(index);
    emit(state.copyWith(checklistDrafts: updated));
  }

  void updateChecklistItem(int index, String content) {
    if (index < 0 || index >= state.checklistDrafts.length) return;
    final updated = List<String>.from(state.checklistDrafts);
    updated[index] = content.trim();
    emit(state.copyWith(checklistDrafts: updated));
  }

  Future<bool> save() async {
    final trimmedTitle = state.title.trim();
    if (trimmedTitle.isEmpty) {
      emit(state.copyWith(titleError: 'Title cannot be empty'));
      return false;
    }

    emit(state.copyWith(status: LoadStatus.loading, failure: null));

    final now = DateTime.now();
    final isEditing = state.taskId != null;
    final taskId = state.taskId ?? _uuid.v4();

    final checklistItems = <ChecklistItemModel>[];
    for (int i = 0; i < state.checklistDrafts.length; i++) {
      final draft = state.checklistDrafts[i];
      if (draft.trim().isEmpty) continue;

      final existing = i < _existingChecklist.length
          ? _existingChecklist[i]
          : null;
      checklistItems.add(
        ChecklistItemModel(
          id: existing?.id ?? _uuid.v4(),
          taskId: taskId,
          content: draft.trim(),
          isCompleted: existing?.isCompleted ?? false,
          sortOrder: i,
          createdAt: existing?.createdAt ?? now,
          updatedAt: now,
        ),
      );
    }

    final taskToSave = TaskModel(
      id: taskId,
      title: trimmedTitle,
      status: TaskStatus.open,
      dueDate: state.dueDate,
      isAllDay: state.isAllDay,
      contextId: state.contextId,
      notes: state.notes,
      effortMinutes: state.effortMinutes,
      checklist: checklistItems,
      createdAt: now,
      updatedAt: now,
    );

    final result = await guard<TaskModel>(
      () => isEditing
          ? _repository.updateTask(taskToSave)
          : _repository.createTask(taskToSave),
      key: 'save_task_$taskId',
    );

    return result.fold(
      (savedTask) {
        emit(state.copyWith(status: LoadStatus.success, failure: null));
        return true;
      },
      (failure) {
        if (failure is! CancelledFailure) {
          emit(state.copyWith(status: LoadStatus.failure, failure: failure));
        }
        return false;
      },
    );
  }
}
