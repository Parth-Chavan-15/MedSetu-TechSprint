import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_shop_registration_widget.dart' show NewShopRegistrationWidget;
import 'package:flutter/material.dart';

class NewShopRegistrationModel
    extends FlutterFlowModel<NewShopRegistrationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for storeNameField widget.
  FocusNode? storeNameFieldFocusNode;
  TextEditingController? storeNameFieldTextController;
  String? Function(BuildContext, String?)?
      storeNameFieldTextControllerValidator;
  // State field(s) for licenseField widget.
  FocusNode? licenseFieldFocusNode;
  TextEditingController? licenseFieldTextController;
  String? Function(BuildContext, String?)? licenseFieldTextControllerValidator;
  // State field(s) for storeAddressField widget.
  FocusNode? storeAddressFieldFocusNode;
  TextEditingController? storeAddressFieldTextController;
  String? Function(BuildContext, String?)?
      storeAddressFieldTextControllerValidator;
  // State field(s) for storePhoneField widget.
  FocusNode? storePhoneFieldFocusNode;
  TextEditingController? storePhoneFieldTextController;
  String? Function(BuildContext, String?)?
      storePhoneFieldTextControllerValidator;
  // State field(s) for isGenericSwitch widget.
  bool? isGenericSwitchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    storeNameFieldFocusNode?.dispose();
    storeNameFieldTextController?.dispose();

    licenseFieldFocusNode?.dispose();
    licenseFieldTextController?.dispose();

    storeAddressFieldFocusNode?.dispose();
    storeAddressFieldTextController?.dispose();

    storePhoneFieldFocusNode?.dispose();
    storePhoneFieldTextController?.dispose();
  }
}
