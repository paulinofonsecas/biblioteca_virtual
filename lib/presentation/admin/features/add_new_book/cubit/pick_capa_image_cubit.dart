import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_capa_image_state.dart';

class PickCapaImageCubit extends Cubit<PickCapaImageState> {
  PickCapaImageCubit() : super(const PickCapaImageInitial());

  Future<void> pickCapaImage() async {
    try {
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (result != null) {
        emit(PickCapaImageSuccess(result.path));
      }
    } catch (e) {
      emit(PickCapaImageError(e.toString()));
    }
  }
}
