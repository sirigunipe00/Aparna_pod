import 'package:freezed_annotation/freezed_annotation.dart';

part 'uom_list_form.freezed.dart';
part 'uom_list_form.g.dart';

@freezed
class UomListForm with _$UomListForm {
  factory UomListForm({
    String? gstin,
    @JsonKey(name: 'name') required String name,
  }) = _UomListForm;

  factory UomListForm.fromJson(Map<String, Object?> json) =>
      _$UomListFormFromJson(json);

  static List<String> fields = ['name'];
}
