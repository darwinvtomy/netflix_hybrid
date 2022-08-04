// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';
import 'package:netflix_hybrid/screens/description_screen.dart';

import 'package:netflix_hybrid/widgets/widgets.dart';

import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;
  Function? onItemFoccused;

  ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    this.isOriginals = false,
    this.onItemFoccused,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  // @override
  // void initState() {
  //   _scrollController = ScrollController();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: getHeight(context),
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return MovieItemWidget(
                  content: content,
                  isOriginals: isOriginals,
                  onItemSelected: () {
                    if (onItemFoccused != null) {
                      onItemFoccused!();
                    }
                    if (index == 0) {
                      _scrollController.animateTo(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }
                  },
                  onItemPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) =>
                            DrillInPageTransition(
                          animation: animation,
                          child: DescriptionScreen(
                            content: content,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  getHeight(BuildContext context) {
    if (Responsive.isAndroidTv(context)) {
      return isOriginals ? 300.0 : 180.0;
    }

    return isOriginals ? 430.0 : 240.0;
  }
}
