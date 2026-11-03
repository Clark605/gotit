import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/features/example/data/models/item_model.dart';

part 'example_detail_state.freezed.dart';

/// Invariant: [failure] is set only when [status] == [LoadStatus.failure]; cleared on loading/success.
@freezed
abstract class ExampleDetailState with _$ExampleDetailState {
  const factory ExampleDetailState({
    @Default(LoadStatus.initial) LoadStatus status,
    ItemModel? item,
    Failure? failure,
  }) = _ExampleDetailState;
}
