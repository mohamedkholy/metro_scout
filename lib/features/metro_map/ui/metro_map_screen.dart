import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_scout/core/theming/my_colors.dart';
import 'package:metro_scout/generated/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as sm;

import '../../../generated/l10n.dart';

class MetroMapScreen extends StatefulWidget {
  const MetroMapScreen({super.key});

  @override
  State<MetroMapScreen> createState() => _MetroMapScreenState();
}

class _MetroMapScreenState extends State<MetroMapScreen> {
  final PageController _controller = PageController();
  final List<String> metroMapImages = [
    Assets.pngCairoMetroMap,
    Assets.pngMetroMap1,
  ];
  int currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      int next = _controller.page!.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).metroMap)),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            sm.SmoothPageIndicator(
              controller: _controller,
              count: metroMapImages.length,
              effect: sm.SlideEffect(
                activeDotColor: MyColors.primaryColor,
                dotHeight: 8.dg,
                dotWidth: 8.dg,
              ),
              onDotClicked: (index) {
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuint,
                );
              },
            ),
            Expanded(
              child: PageView.builder(
                itemCount: metroMapImages.length,
                itemBuilder: (context, index) {
                  return _buildPage(
                    metroMapImages[index],
                    index == currentPage,
                  );
                },
                controller: _controller,
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String metroMapImage, bool active) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 10.h : 50.h;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 30.h, right: 10.w, left: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
        color: Colors.white, // optional background color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 1,
          maxScale: 5,
          child: Image.asset(metroMapImage, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
