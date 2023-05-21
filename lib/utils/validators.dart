import 'package:form_field_validator/form_field_validator.dart';

final requiredValidator =
    RequiredValidator(errorText: 'This field is required');

final emailValidator =
    EmailValidator(errorText: 'Please enter valid email-id.');
