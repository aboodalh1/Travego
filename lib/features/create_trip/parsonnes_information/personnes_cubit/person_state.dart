part of 'person_cubit.dart';
abstract class PersonState {}

class PersonInit extends PersonState {}

class AddPerson extends PersonState {}

class EditPerson extends PersonState {}

class ConfirmPerson extends PersonState {}

class RemovePerson extends PersonState {}

class AddPersonsScreen extends PersonState {}