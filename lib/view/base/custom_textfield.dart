import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final String title;
  final bool titleText;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final bool showPassword;
  final TextEditingController? controller;
  final String hintText;
  final TextInputAction inputAction;
  final Color? textColor;
  final bool isEnabled;
  final double height;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius; // Border radius property
  final bool required;
  final bool titleRequired;
  final bool color;
  final bool readonly;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.title,
    this.color = false,
    required this.hintText,
    this.radius = 30, // Default border radius
    this.isPassword = false,
    this.showPassword = false,
    this.inputType,
    this.inputAction = TextInputAction.next,
    this.controller,
    this.textColor,
    this.isEnabled = true,
    super.key,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 50,
    this.maxLines,
    this.required = false,
    this.validator,
    this.titleRequired = false,
    this.readonly = false,
    this.titleText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              " ${widget.title}",
              style: interMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmallOnly,
                  height: 1.4,
                  color: Theme.of(context).disabledColor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: widget.height,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onError,
                borderRadius: BorderRadius.circular(widget.radius),
                border: Border.all(
                    width: widget.titleText ? 4 : 1,
                    color: Theme.of(context).colorScheme.error)),
            child: TextFormField(
              validator: widget.required ? widget.validator : null,
              keyboardType: widget.inputType,
              readOnly: widget.readonly,
              focusNode: widget.focusNode,
              controller: widget.controller,
              cursorColor: Theme.of(context).primaryColor,
              textInputAction: widget.inputAction,
              style: interRegular.copyWith(
                fontSize: Dimensions.fontSizeExtraSmall,
                color: widget.titleText
                    ? Theme.of(context).shadowColor
                    : Colors.black,
              ),
              enabled: widget.isEnabled,
              maxLines: widget.maxLines,
              obscureText: widget.isPassword ? _obscureText : false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide.none, // No border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0.0, // Vertical padding
                  horizontal: 12.0, // Horizontal padding
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).disabledColor,
                        ),
                      )

                    // Padding(
                    //         padding: const EdgeInsets.only(top: 10, right: 15),
                    //         child: GestureDetector(
                    //           onTap: _toggle,
                    //           child: Text(
                    //             _obscureText ? 'show'.tr : 'hide'.tr,
                    //             style: interMedium.copyWith(
                    //                 color: Theme.of(context).hintColor,
                    //                 fontSize: 14),
                    //           ),
                    //         ),
                    //       )
                    : widget.suffixIcon,
                hintText: widget.hintText,
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                hintStyle: interRegular.copyWith(
                  fontSize: Dimensions.fontSizeExtraSmall,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

class ExamTextField extends StatelessWidget {
  final String title;
  final String hintText;
  const ExamTextField({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "$title".tr,
              style: interMedium.copyWith(
                  fontSize: Dimensions.fontSizeExtraSmall,
                  height: 1.4,
                  color: Theme.of(context).disabledColor),
            ),
          ),
          const SizedBox(
            height: Dimensions.radiusSmall,
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [BoxShadow()],
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '$hintText'.tr,
                  contentPadding: EdgeInsets.only(
                    left: 12,
                  ),
                  hintStyle: interMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraSmall,
                      color: Theme.of(context).disabledColor),
                ),
              )),
        ],
      ),
    );
  }
}

class Customfield extends StatefulWidget {
  final bool isPassword;
  final String title;
  final bool titleText;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final bool showPassword;
  final TextEditingController? controller;
  final String hintText;
  final TextInputAction inputAction;
  final Color? textColor;
  final bool isEnabled;
  final double height;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius; // Border radius property
  final bool required;
  final bool titleRequired;
  final bool color;
  final bool readonly;

  const Customfield({
    required this.title,
    this.color = false,
    required this.hintText,
    this.radius = 30, // Default border radius
    this.isPassword = false,
    this.showPassword = false,
    this.inputType,
    this.inputAction = TextInputAction.next,
    this.controller,
    this.textColor,
    this.isEnabled = true,
    super.key,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 50,
    this.maxLines,
    this.required = false,
    this.titleRequired = false,
    this.readonly = false,
    this.titleText = false,
  });

  @override
  State<Customfield> createState() => _CustomfieldState();
}

class _CustomfieldState extends State<Customfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              " ${widget.title}",
              style: interMedium.copyWith(
                fontSize: Dimensions.fontSizeExtraSmall,
                height: 1.4,
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [BoxShadow()],
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            ),
            child: TextField(
              keyboardType: widget.inputType,
              readOnly: widget.readonly,
              focusNode: widget.focusNode,
              controller: widget.controller,
              cursorColor: Theme.of(context).primaryColor,
              textInputAction: widget.inputAction,
              style: interMedium.copyWith(
                fontSize: Dimensions.fontSizeExtraSmall,
                color: Theme.of(context).disabledColor,
              ),
              enabled: widget.isEnabled,
              maxLines: widget.maxLines,
              obscureText: widget.isPassword ? _obscureText : false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide.none, // No border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0.0, // Vertical padding
                  horizontal: 12.0, // Horizontal padding
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).disabledColor,
                        ),
                      )
                    : widget.suffixIcon,
                hintText: widget.hintText,
                hintStyle: interMedium.copyWith(
                  fontSize: Dimensions.fontSizeExtraSmall,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
