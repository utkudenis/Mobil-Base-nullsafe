import 'dart:convert';
import 'dart:io';
// Helpers
import 'app_state_helper.dart';
import 'log_helper.dart';
import 'localization_helper.dart';
//Package
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/painting.dart' as painting;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserPhotoHelper {
  static void imagePicker(ImageSource source) async {
    final imagePicker = ImagePicker();

    PickedFile? image;
    try {
      AppStateHelper.isCameraOrGalleryActive = true;
      image = await imagePicker.getImage(source: source, maxWidth: 980, maxHeight: 980);
    } catch (ex) {
      LogHelper.logError("user_photo_helper.dart", "imagePicker.getImage", ex.toString());
    }
    AppStateHelper.isCameraOrGalleryActive = false;

    if (image != null) {
      File? pickedFile;
      pickedFile = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          androidUiSettings: AndroidUiSettings(initAspectRatio: CropAspectRatioPreset.square, lockAspectRatio: true),
          iosUiSettings: IOSUiSettings(rectHeight: 1, rectWidth: 1, aspectRatioLockEnabled: true, doneButtonTitle: localize(AppStateHelper.appContext, 'image_picker_done_button_title')));

      final bytes = await pickedFile!.readAsBytes();
      String base64Image = base64Encode(bytes);
      LogHelper.logMessage("user_photo_helper.dart", "imagePicker.getImage", "Image converted To base64Image" + base64Image);
      /******** Make your upload action !!  **********/
      // var store = AppReduxStore.currentStore;
      // store.dispatch(uploadUserImageAction(base64Image, afterUploadFinished: () {
      //   imageCache.clearLiveImages();
      //   painting.imageCache.clear();
      // }));
      /***********************************************/
    }
  }
}
