// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_healthy_pet/models/doctor_model.dart';
import 'package:slicing_healthy_pet/models/service_model.dart';

var selectedService = 0;
var selectedMenu = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _greetings(),
            const SizedBox(
              height: 16,
            ),
            _card(),
            const SizedBox(
              height: 20,
            ),
            _search(),
            const SizedBox(
              height: 20,
            ),
            _services(),
            const SizedBox(
              height: 27,
            ),
            _doctors()
          ],
        ),
      )),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: const Color(0xff818AF9),
        type: BottomNavigationBarType.fixed,
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xffBFBFBF),
      );

  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff35385A).withOpacity(.12),
                blurRadius: 30,
                offset: const Offset(0, 2))
          ]),
      child: Row(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            'assets/images/${doctorModel.image}',
            width: 88,
            height: 103,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorModel.name,
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff3F3E3F)),
            ),
            const SizedBox(
              height: 7,
            ),
            RichText(
                text: TextSpan(
                    text: 'Service: ${doctorModel.service.join(', ')}',
                    style: GoogleFonts.manrope(
                        fontSize: 12, color: Colors.black))),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Icon(
                  FeatherIcons.mapPin,
                  size: 14,
                  color: Color(0xffACA3A3),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text("${doctorModel.distance}km",
                    style: GoogleFonts.manrope(
                        fontSize: 12, color: const Color(0xffACA3A3)))
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available For',
                  style: GoogleFonts.manrope(
                      color: const Color(0xff50CC98),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  width: 90,
                ),
                SvgPicture.asset('assets/svgs/cat.svg'),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/svgs/dog.svg'),
              ],
            ),
          ],
        )
      ]),
    );
  }

  SizedBox _services() {
    return SizedBox(
        height: 36,
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: selectedService == index // Perubahan di sini
                          ? const Color(0xff818AF8) // Ganti warna ini
                          : const Color(0xffF6F6F6),
                      border: selectedService == index // Perubahan di sini
                          ? Border.all(
                              color: const Color(0xffF1E5E5).withOpacity(.22),
                              width: 2)
                          : null,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    Service.all()[index],
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selectedService == index // Perubahan di sini
                          ? Colors.white // Ganti warna ini
                          : const Color(0xff3F3E3F).withOpacity(0.3),
                    ),
                  )),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
            itemCount: Service.all().length));
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            FeatherIcons.search,
            color: Color(0xffADACAD),
          ),
          hintText: "Find best vaccinate, treatment...",
          hintStyle: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xffCACACA),
              height: 150 / 100),
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xff818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_card.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: 'Your',
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: const Color(0xffDEE1FE),
                              height: 150 / 100),
                          children: const [
                            TextSpan(
                                text: ' Catrine ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(text: 'will get\nvaccination'),
                            TextSpan(
                                text: ' tomorrow\nat 07.00 am!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                          ])),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.12), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'See details',
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Human!',
            style: GoogleFonts.manrope(
                color: const Color(0xff3F3E3F),
                fontSize: 24,
                fontWeight: FontWeight.w800),
          ),
          Stack(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.shoppingBag,
                color: Color(0xff818AF9),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: const Color(0xffEF6497),
                    borderRadius: BorderRadius.circular(15 / 2)),
                child: Center(
                    child: Text(
                  '2',
                  style: GoogleFonts.mPlus1p(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800),
                )),
              ),
            )
          ])
        ],
      ),
    );
  }
}
