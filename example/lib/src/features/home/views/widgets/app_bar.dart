import 'package:example/src/core/usecase/responsive/responsive.dart';
import 'package:example/src/features/home/views/ui_states/extra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToastAppBar extends StatelessWidget {
  const ToastAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final sidePaddings = context.responsiveValue(
      desktop: 58.0,
      tablet: 32.0,
    );

    if (!context.isInMobileZone) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          sidePaddings,
          54,
          sidePaddings,
          0,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/img/logo.png',
              height: 60,
              width: 60,
            ),
            const SizedBox(width: 14),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                'img/logo-text.svg',
                height: 35,
              ),
            ),
            const Spacer(),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black12,
                foregroundColor: colorScheme.onBackground,
              ),
              onPressed: () {
                openGithub(context);
              },
              icon: const FaIcon(FontAwesomeIcons.github),
              label: const Text('Check the code'),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        24,
        56,
        24,
        0,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/img/logo.png',
            height: 82,
            width: 82,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: SvgPicture.asset(
              'img/logo-text.svg',
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      delegate: SliverPersistance(),
      pinned: true,
    );
  }
}

class SliverPersistance extends SliverPersistentHeaderDelegate {
  const SliverPersistance();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    final shrinkPercentage = 1 - ((maxExtent - shrinkOffset) / 100);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow.lerp(const BoxShadow(),const BoxShadow() , shrinkPercentage)!,
        ],
      ),
      height: maxExtent,
    );
  }

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 72;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
