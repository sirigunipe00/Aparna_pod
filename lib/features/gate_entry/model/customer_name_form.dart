import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_name_form.freezed.dart';
part 'customer_name_form.g.dart';

@freezed
class SupplierNameForm with _$SupplierNameForm {
  factory SupplierNameForm({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'supplier_name') required String supName,
  }) = _SupplierNameForm;

  factory SupplierNameForm.fromJson(Map<String, Object?> json) =>
      _$SupplierNameFormFromJson(json);

  static List<String> fields = ['name'];
}
