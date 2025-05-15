import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/helper/my_responsive.dart';
import 'package:login_task_nti/core/utils/png.dart';
import 'package:login_task_nti/core/widgets/image_manager/cubit/image_manager_cubit.dart';
import 'package:login_task_nti/core/widgets/image_manager/cubit/image_manager_state.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView(
      {super.key, required this.pickImage, this.pickedBody, this.unPickedBody});
  final void Function(XFile image) pickImage;
  final Widget Function(XFile image)? pickedBody;
  final Widget? unPickedBody;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ImageManagerCubit(),
        child: BlocConsumer<ImageManagerCubit, ImageManagerState>(
            builder: (context, state) {
          return InkWell(
            onTap: () {
              ImageManagerCubit.get(context).getImage();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Builder(builder: (context) {
                if (state is ImageManagerPickImage) {
                  if (pickedBody != null) return pickedBody!(state.image);
                  return InkWell(
                      onTap: () {
                        ImageManagerCubit.get(context)
                            .getImage(source: ImageSource.gallery);
                      },
                      child: Image.file(
                        File(state.image.path),
                        width: MyResponsive.width(context, 261),
                        height: MyResponsive.height(context, 207),
                        fit: BoxFit.fill,
                      ));
                }
                if (unPickedBody != null) return unPickedBody!;
                return Image.asset(
                  PngAssets.loginViewImage,
                  width: MyResponsive.width(context, 261),
                  height: MyResponsive.height(context, 207),
                  fit: BoxFit.fill,
                );
              }),
            ),
          );
        }, listener: (context, state) {
          if (state is ImageManagerPickImage) {
            pickImage(state.image);
          }
        }));
  }
}
