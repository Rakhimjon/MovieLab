import 'package:flutter/material.dart';
import 'package:movielab/models/show_models/show_preview_model.dart';
import 'package:movielab/pages/shared/show_popup/show_popup_actions.dart';
import 'show_box_common.dart';

class ShowBox extends StatefulWidget {
  final ShowPreview showPreview;
  final String preTag;
  const ShowBox({Key? key, required this.showPreview, this.preTag = ""})
      : super(key: key);

  @override
  State<ShowBox> createState() => _ShowBoxState();
}

class _ShowBoxState extends State<ShowBox> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    String title = widget.showPreview.title;
    String year = widget.showPreview.year;
    String crew = widget.showPreview.crew;
    String id = widget.showPreview.id;
    return InkWell(
      onTap: () {
        openShowPage(context, id: id, preTag: widget.preTag);
      },
      onLongPress: () async {
        await Future.delayed(const Duration(milliseconds: 250));
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          transitionAnimationController: AnimationController(
              duration: const Duration(milliseconds: 235), vsync: this),
          builder: (context) {
            return ShowPopupActions(
              show: widget.showPreview,
            );
          },
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        width: 155,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                boxImage(
                    image: widget.showPreview.image,
                    tag: "${widget.preTag}_show_$id",
                    height: 210,
                    width: 145,
                    radius: 17.5),
                Positioned(
                  right: 7.5,
                  top: 7.5,
                  child: Container(
                    width: 30,
                    height: 17.5,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: Center(
                      child: Text(
                        widget.showPreview.imDbRating,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 155,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: showBoxText(
                      text: title,
                      isItTitle: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  year != ""
                      ? Flexible(
                          flex: 1,
                          child: showBoxText(
                            text: " ($year)",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const Text("")
                ],
              ),
            ),
            Container(
              width: 155,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Flexible(
                    child: showBoxText(
                        text: crew,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
