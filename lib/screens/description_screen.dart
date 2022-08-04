import 'package:fluent_ui/fluent_ui.dart';

import '../models/content_model.dart';
import '../widgets/icon_button.dart';

class DescriptionScreen extends StatelessWidget {
  final Content content;
  const DescriptionScreen({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 400.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20.0),
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 30),
                            child: Text(content.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Row(
                            children: [
                              CustomIconButton(
                                onSelected: () {
                                  print('Play');
                                },
                                icon: FluentIcons.play,
                                title: 'Play Tarailer',
                                onClick: () {},
                              ),
                              CustomIconButton(
                                onSelected: () {
                                  print('Play');
                                },
                                icon: FluentIcons.play,
                                title: 'Play Movie',
                                onClick: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    iconButtonMode: IconButtonMode.large,
                    icon: const Icon(
                      FluentIcons.back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(content.description ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300)),
            ),
          ],
        ),
      ),
    );
  }
}
