import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'form_control_state.dart';

class FormControlCubit extends Cubit<FormControlState> {
  FormControlCubit() : super(FormControlInitial()) {
    formKey = GlobalKey<FormState>();
  }

  late GlobalKey<FormState> formKey;
}
