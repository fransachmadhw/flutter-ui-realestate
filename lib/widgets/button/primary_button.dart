import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';

enum ButtonType { primary, secondary, tertiary }

class PrimaryButton extends StatelessWidget {
  final String title;
  final Enum type;
  final Function onPressed;
  final bool isLoading;

  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.type,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return ElevatedButton(
      onPressed: () =>
          !isLoading ? onPressed() : {}, // prevent click when state is loading
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return type == ButtonType.primary ? primary300 : primary300;
            }
            return type == ButtonType.primary ? primary500 : dark500;
          },
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: spacing * 2),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius * 10),
            side: BorderSide(
              color: type == ButtonType.secondary ? grey500 : dark500,
              width: 1,
            ),
          ),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: spacing * 3,
              height: spacing * 3,
              child: CircularProgressIndicator(color: white),
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: type == ButtonType.primary ? white : white,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.blockSizeHorizontal! * 4),
            ),
    );
  }
}
