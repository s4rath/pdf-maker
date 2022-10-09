import 'dart:io';

import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void selectByCamera(){
  final configs = ImagePickerConfigs();

    configs.appBarTextColor = Colors.white;

    configs.appBarBackgroundColor = Colors.transparent;
    configs.doneButtonDisabledBehavior = DoneButtonDisabledBehavior.hidden;
    configs.doneButtonStyle = DoneButtonStyle.iconButton;
    configs.albumPickerModeEnabled = false;

    configs.showLensDirection = false;
    configs.cameraLensDirection = 1;

    configs.translateFunc = (name, value) => Intl.message(value, name: name);

    configs.adjustFeatureEnabled = false;
    configs.externalImageEditors['external_image_editor_1'] = EditorParams(
      title: 'Edit',
      icon: Icons.edit_rounded,
      onEditorEvent: (
              {required BuildContext context,
              required File file,
              required String title,
              int maxWidth = 1080,
              int maxHeight = 1920,
              int compressQuality = 90,
              ImagePickerConfigs? configs}) async =>
          Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => ImageEdit(
              file: file,
              title: title,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              configs: configs),
        ),
      ),
    );
    configs.cropFeatureEnabled = false;
    configs.stickerFeatureEnabled = false;
    configs.flashMode = FlashMode.off;
    configs.translateFunc = (name, value) {
      switch (name) {
        case 'image_picker_select_images_title':
          return 'Selected Images';
        case 'image_picker_select_images_guide':
          return '';
        case 'image_picker_camera_title':
          return 'Camera';
        case 'image_picker_album_title':
          return 'Album';
        case "image_picker_preview_title":
          return 'Perview';
        case "image_picker_confirm":
          return 'Confirm';
        case "image_picker_exit_without_selecting":
          return "Do you want to exit without selecting images?";
        case "image_picker_confirm_delete":
          return "Do you want to delete this image?";
        case "image_picker_confirm_reset_changes":
          return "Do you want to clear all changes for this image?";
        case "yes":
          return 'Yes';
        case 'no':
          return 'No';
        case 'save':
          return 'Save';
        case 'clear':
          return 'Clear';
        case "image_picker_edit_text":
          return "Edit text";
        case "image_picker_no_images":
          return "No images ...";
        case "image_picker_image_filter_title":
          return "Image filter";
        case "image_picker_image_edit_title":
          return "Image edit";
        default:
          return value;
      }
    };
}