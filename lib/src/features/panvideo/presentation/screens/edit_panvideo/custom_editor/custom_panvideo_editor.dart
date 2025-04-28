// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/edit_panvideo_result_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/custom_editor/custom_panvideo_editor_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/panvideo_editor.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomPanvideoEditor extends PanvideoEditor {
  @override
  Future<EditPanvideoResultDto?> editVdieo(EditPanvideoArgs args) async {
    return Global.pushNamed(CustomPanvideoEditorScreen.router, args: args) as EditPanvideoResultDto?;
  }
}
