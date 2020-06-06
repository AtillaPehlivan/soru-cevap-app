import 'package:image_picker/image_picker.dart';

class ImageService {
  ImageService._private();

  static ImageService _instance = ImageService._private();

  static ImageService get instance => _instance;

   String lastImagePath = "";

  ImagePicker _imagePicker;

  Future<void> init() async {
    _imagePicker = new ImagePicker();
  }

  Future<String> getImageFromCamera() async {
    PickedFile pickedFile = await _imagePicker.getImage(source: ImageSource.camera);
    lastImagePath = pickedFile.path;
    return pickedFile.path;
  }

  Future<String> getImageFromGallery() async {
    PickedFile pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
    lastImagePath = pickedFile.path;
    return pickedFile.path;
  }
}
