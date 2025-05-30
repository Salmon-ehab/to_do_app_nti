import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class TaskModel {
  String? title;
  String? desc;
  XFile? image;

  TaskModel({this.title, this.desc, this.image});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        title: json['title'], desc: json['description'], image: json['image']);
  }
 FormData toFormData() {
    return FormData.fromMap({
      'title': title ?? "",
      'description': desc ?? "",
      if (image != null)
        'image': MultipartFile.fromFileSync(image!.path, filename: image!.name),
    });
  }
  // Future<Map<String, dynamic>> toJson() async {
  //   return {
  //     'title': title??"",
  //     'description': desc??"",
  //     'image': image == null
  //         ? null
  //         : await MultipartFile.fromFile(image!.path, filename: image!.name)
  //   };
  // }
}
