import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go_task/view_model/cubit/home_cubit.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String? hintText;
  final double? borderRaides;
  final double? containerBorderRaides;
  final double? hintSize;
  final Color? formFieldBorderColor;
  final Widget? suffixWidget;
  final TextAlign? textAlign;
  final bool? isWithBorder;
  final double? height;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  const PrimaryTextFormField({
    super.key,
    this.hintText,
    this.borderRaides,
    this.hintSize,
    this.formFieldBorderColor,
    this.suffixWidget,
    this.textAlign,
    this.isWithBorder,
    this.height,
    this.controller,
    this.containerBorderRaides,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: height ?? 50.h,
          width: double.infinity,
          padding: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(containerBorderRaides ?? 10.r),
          ),
          child: TextFormField(
            onTap: onTap,
            keyboardType: TextInputType.name,
            textAlign: textAlign ?? TextAlign.center,
            readOnly: readOnly,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText ?? 'Select City',
              hintStyle: TextStyle(
                fontSize: hintSize ?? 18.sp,
                color: Colors.blue,
              ),
              suffixIcon: suffixWidget,
              border: OutlineInputBorder(
                borderSide: isWithBorder == true
                    ? BorderSide(color: formFieldBorderColor ?? Colors.green)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRaides ?? 30.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: isWithBorder == true
                    ? BorderSide(color: formFieldBorderColor ?? Colors.blue)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRaides ?? 30.r),
              ),
            ),
          ),
        );
      },
    );
  }
}
