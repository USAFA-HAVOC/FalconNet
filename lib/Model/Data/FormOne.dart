import 'package:falcon_net/Model/Store/GlobalState.dart';

class FormOne {
  final String title;
  final String description;
  final bool signed;

  const FormOne({required this.title, required this.description, required this.signed});

  FormOne sign() => FormOne(title: title, description: description, signed: true);
}