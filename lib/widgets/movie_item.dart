// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';
import 'package:netflix_hybrid/widgets/responsive.dart';

import '../models/models.dart';

class MovieItemWidget extends StatefulWidget {
  const MovieItemWidget({
    Key? key,
    required this.content,
    required this.isOriginals,
    required this.onItemSelected,
    required this.onItemPressed,
  }) : super(key: key);

  final Content content;
  final bool isOriginals;
  final Function onItemSelected;
  final Function onItemPressed;

  @override
  State<MovieItemWidget> createState() => _MovieItemWidgetState();
}

class _MovieItemWidgetState extends State<MovieItemWidget> {
  bool isfocused = false;
  bool onhover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(isfocused ? 0 : 5),
      duration: Duration(milliseconds: 350),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isfocused = true;
          });
        },
        onExit: (event) {
          setState(() {
            isfocused = false;
          });
        },
        child: HoverButton(
          onPressed: () {
            widget.onItemPressed();
          },
          focusEnabled: true,
          onFocusChange: ((focus) {
            setState(() {
              isfocused = focus;
              if (focus) {
                debugPrint('On ITEM SELECTED is $focus ');
                widget.onItemSelected();
              }
            });
          }),
          builder: (context, states) {
            return FocusBorder(
              focused: states.isFocused,
              renderOutside: true,
              child: Tooltip(
                useMousePosition: true,
                message: '${widget.content.name}',
                child: RepaintBoundary(
                  child: AnimatedContainer(
                    curve: Curves.bounceOut,
                    duration: FluentTheme.of(context).fasterAnimationDuration,
                    decoration: BoxDecoration(
                      color: ButtonThemeData.uncheckedInputColor(
                        FluentTheme.of(context),
                        states,
                      ),
                      // borderRadius: BorderRadius.circular(20.0),
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                        image: AssetImage(widget.content.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // padding: const EdgeInsets.all(6.0),
                    height: getHeight(),
                    width: getWidth(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  double getHeight() {
    if (Responsive.isAndroidTv(context)) {
      return widget.isOriginals ? 205.0 : 123.0;
    }
    return widget.isOriginals ? 400.0 : 200.0;
  }

  double getWidth() {
    if (Responsive.isAndroidTv(context)) {
      return widget.isOriginals ? 135.0 : 81.0;
    }
    return widget.isOriginals ? 200.0 : 130.0;
  }
}
