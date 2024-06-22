import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(const PickImageInitial());

  Future<void> pickImage() async {
    try {
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (result != null) {
        emit(PickImageSuccess(result.path));
      }
    } catch (e) {
      emit(PickImageError(e.toString()));
    }
  }
}
