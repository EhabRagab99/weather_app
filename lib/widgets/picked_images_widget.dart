import 'dart:io';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utilites/extenstions/helper.dart';
import 'package:iem_app/widgets/custom_stack_widget.dart';
import 'package:flutter/material.dart';

class PickedImagesWidget extends StatefulWidget {
  const PickedImagesWidget({super.key, required this.pickedImages,  required this.noImagesCallback});
  final List<File>pickedImages;
  final void Function(bool isEmpty) noImagesCallback;

  @override
  State<PickedImagesWidget> createState() => _PickedImagesWidgetState();
}

class _PickedImagesWidgetState extends State<PickedImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 74,
      width: double.maxFinite,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsetsDirectional.only(top: 8),
          scrollDirection: Axis.horizontal,
          children:widget.pickedImages.map((e) => GestureDetector(
            onTap: () {
              setState(() {
                widget.pickedImages.remove(e);
                if(widget.pickedImages.isEmpty){
                  widget.noImagesCallback(true);
                }
              });
            },
            child: ConfirmSendingImageWidget(
              pickedImage: e,
            ),
          )).toList()),
    );
  }
}


class ConfirmSendingImageWidget extends StatelessWidget {
  const ConfirmSendingImageWidget({Key? key, required this.pickedImage, this.onTapRemove})
      : super(key: key);

  final File pickedImage;
  final void Function()? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 12),
      child: CustomStackWidget(
        children: [
          GestureDetector(
            // onTap: () => StateShowImage(context).onShowImage(context: context, currentIndex: 0, pickedImage: pickedImage),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9), // Image border
                  border: Border.all(color: ColorConfig().blackColor(0.7), width: 1.5,),),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(34), // Image radius
                  child: Image.file(pickedImage, fit: BoxFit.cover).showOnTap(context),
                ),
              ),
            ),
          ),
          PositionedDirectional(
            end: -8,
            top: -8,
            child: Container(
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  color: ColorConfig().whiteColor(1), shape: BoxShape.circle),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: ColorConfig().blackColor(1), shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: onTapRemove,
                  child: Icon(
                    Icons.close,
                    color: ColorConfig().whiteColor(1),
                    size: 10,
                  ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


