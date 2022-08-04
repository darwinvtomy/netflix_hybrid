import 'package:fluent_ui/fluent_ui.dart';

import 'responsive.dart';

class CustomIconButton extends StatelessWidget {
  final Function? onSelected;
  final IconData? icon;
  final String title;
  final Function onClick;
  const CustomIconButton(
      {super.key,
      this.onSelected,
      this.icon,
      required this.title,
      required this.onClick});
  @override
  Widget build(BuildContext context) {
    return HoverButton(
      focusEnabled: true,
      onFocusChange: ((focus) {
        if (focus) {
          if (onSelected != null) {
            onSelected!();
            print('Selected Play');
          }
        }
      }),
      onPressed: () {
        onClick();
        print('Play or More Info');
      },
      builder: (BuildContext, Set<ButtonStates> state) {
        return FocusBorder(
          focused: state.isFocused,
          renderOutside: true,
          child: Container(
            decoration: const BoxDecoration(
              //   color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            padding: !Responsive.isDesktop(context)
                ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
                : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
            child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 30.0,
                    color: Colors.white,
                  ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
