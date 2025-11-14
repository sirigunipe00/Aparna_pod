import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_name_form.freezed.dart';
part 'material_name_form.g.dart';

@freezed
class MaterialNameForm with _$MaterialNameForm {
  factory MaterialNameForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'stock_uom') String? uom,
    @JsonKey(name: 'item_name') String? itemName,

  }) = _MaterialNameForm;

  factory MaterialNameForm.fromJson(Map<String, Object?> json) =>
      _$MaterialNameFormFromJson(json);

  static List<String> fields = ['name', 'description' , 'stock_uom', 'item_name'];
}
