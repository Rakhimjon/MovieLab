import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielab/constants/colors.dart';
import 'package:movielab/pages/main/home/home_data_controller.dart';
import 'package:movielab/pages/show/show_box/boxoffice_show_box.dart';

class AllTimeBoxOfficePage extends StatelessWidget {
  const AllTimeBoxOfficePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDataController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: 22.5,
                  )),
              backgroundColor: kPrimaryColor,
              title: const Text("Box Office Of All Time",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: _.allTimeBoxOffice.isNotEmpty
                        ? ListView.builder(
                            itemCount: _.allTimeBoxOffice.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BoxOfficeShowBox(
                                  showPreview: _.allTimeBoxOffice[index]);
                            },
                          )
                        : const Center(
                            child: SpinKitThreeBounce(
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
