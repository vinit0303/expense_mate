import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextFormFields extends StatefulWidget {
  AppTextFormFields({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.focusNode,
    this.readOnly = false,
    this.prefixIcon,
    this.showError = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  AppTextFormFields.prefix({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.hint,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.focusNode,
    this.readOnly = false,
    this.showError = false,
    this.onChanged,
  }) : super(key: key);

  AppTextFormFields.multiline({
    Key? key,
    required this.controller,
    required this.label,
    this.hint,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines = 3,
    this.maxLines = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.focusNode,
    this.readOnly = false,
    this.showError = false,
    this.prefixIcon,
    this.onChanged,
  }) : super(key: key);

  AppTextFormFields.intOnly({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.textStyle,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.focusNode,
    this.readOnly = false,
    this.showError = false,
    this.prefixIcon,
    this.onChanged,
  })  : textInputType = const TextInputType.numberWithOptions(
            decimal: false, signed: false),
        super(key: key);

  final TextEditingController controller;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  FormFieldValidator<String>? validator;
  TextStyle? textStyle;
  final String? label;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixIcon;
  int? minLines;
  int? maxLines;
  EdgeInsetsGeometry padding;
  FocusNode? focusNode;
  final bool readOnly;
  final bool showError;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;

  @override
  State<AppTextFormFields> createState() => _AppTextFormFieldsState();
}

class _AppTextFormFieldsState extends State<AppTextFormFields> {
  late FocusNode focusNode;
  bool _isfeildfocused = false;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    super.initState();
    focusNode.addListener(() {
      setState(() {
        _isfeildfocused = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConst.fontColorBlack,
        width: 1,
      ),
    );
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      focusNode: focusNode,
      readOnly: widget.readOnly,
      style: widget.textStyle ??
          AppTextStyles.regular(
              fontSize: 16,
              color: _isfeildfocused
                  ? ColorConst.primaryBlack
                  : ColorConst.appgreycolor),
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: ColorConst.primaryWhite,
        errorStyle: widget.showError
            ? (widget.textStyle ?? AppTextStyles.regular(fontSize: 16))
                .copyWith(color: Colors.redAccent)
            : const TextStyle(fontSize: 0),
        label: widget.label != null
            ? Text(
                widget.label!,
                style: AppTextStyles.regular(
                    fontSize: 12,
                    color: _isfeildfocused
                        ? ColorConst.primaryBlack
                        : ColorConst.appgreycolor),
              )
            : null,
        labelStyle: AppTextStyles.regular(
            fontSize: 12,
            color: _isfeildfocused
                ? ColorConst.primaryBlack
                : ColorConst.appgreycolor),
        alignLabelWithHint: true,
        hintText: widget.hint,
        hintStyle: AppTextStyles.regular(
            fontSize: 16,
            color: _isfeildfocused
                ? ColorConst.primaryBlack
                : ColorConst.appgreycolor),
        border: border,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConst.appgreycolor)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConst.appbluecolor)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConst.appgreycolor, width: 1.0),
        ),
        focusedErrorBorder: border,
        suffixIcon: widget.suffixIcon,
        prefixIcon: ((widget.prefixIcon) != null)
            ? Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: ImageIcon(
                  AssetImage(widget.prefixIcon!),
                  color: ColorConst.primaryBlack,
                  size: 16,
                ),
              )
            : null,
      ),
    );
  }
}
