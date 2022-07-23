part of '../profile_page.dart';

class _LoadingProfileLayout extends StatelessWidget {
  const _LoadingProfileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Shimmer.fromColors(
        baseColor: UIColors.shimmerBaseGrey,
        highlightColor: UIColors.shimmerHighlightGrey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ShimmerItem(
              height: 36,
              width: 36,
            ),
            VerticalSpacer(height: 16),
            ShimmerItem(
              height: 18,
              widthFactor: 0.6,
            ),
            VerticalSpacer(height: 16),
            ShimmerItem(
              height: 14,
              widthFactor: 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
