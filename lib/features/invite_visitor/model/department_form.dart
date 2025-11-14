
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_form.freezed.dart';
part 'department_form.g.dart';

@freezed
class DepartmentForm with _$DepartmentForm {
  factory DepartmentForm({
    @JsonKey(name: 'name')  required String name,
    
  }) = _DepartmentForm;

  factory DepartmentForm.fromJson(Map<String, Object?> json) =>
      _$DepartmentFormFromJson(json);

     static List<String> fields = ['name'];

  
}