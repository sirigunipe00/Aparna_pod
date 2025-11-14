import 'package:freezed_annotation/freezed_annotation.dart';

part 'receiver_address_form.freezed.dart';
part 'receiver_address_form.g.dart';

@freezed
class ReceiverAddressForm with _$ReceiverAddressForm {
  factory ReceiverAddressForm({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address_title') required String addressTitle,
    @JsonKey(name: 'address_type') required String addressType,
    String? city,
    String? pincode,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'address_line1') String? line1,
    @JsonKey(name: 'address_line2') String? line2,
  }) = _ReceiverAddressForm;

  factory ReceiverAddressForm.fromJson(Map<String, Object?> json) =>
      _$ReceiverAddressFormFromJson(json);

  static List<String> fields = ['name'];
}
