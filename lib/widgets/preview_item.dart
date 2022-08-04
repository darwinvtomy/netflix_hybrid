import 'package:fluent_ui/fluent_ui.dart';

import '../models/content_model.dart';

class PreviewItem extends StatefulWidget {
  const PreviewItem({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content content;

  @override
  State<PreviewItem> createState() => _PreviewItemState();
}

class _PreviewItemState extends State<PreviewItem> {
  bool isfocused = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(isfocused ? 0 : 5),
      duration: Duration(milliseconds: 300),
      child: HoverButton(
          onFocusChange: ((focus) {
            setState(() {
              print('Foccused on${widget.content.name} is $focus ');
              isfocused = focus;
            });
          }),
          onPressed: () => print(widget.content.name),
          builder: (context, states) {
            return FocusBorder(
              focused: states.isFocused,
              renderOutside: true,
              child: Tooltip(
                useMousePosition: true,
                message: '${widget.content.name}',
                child: RepaintBoundary(
                  child: AnimatedContainer(
                    duration: FluentTheme.of(context).fasterAnimationDuration,
                    decoration: BoxDecoration(
                      color: ButtonThemeData.uncheckedInputColor(
                        FluentTheme.of(context),
                        states,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.all(6.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.content.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: widget.content.color!, width: 4.0),
                          ),
                        ),
                        Container(
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: widget.content.color!, width: 4.0),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 60.0,
                            child: Image.asset(widget.content.titleImageUrl!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
