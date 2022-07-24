part of '../friends_page.dart';

class _FriendsLoadingLayout extends StatelessWidget {
  const _FriendsLoadingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (_, __) => const VerticalSpacer(height: 8),
      itemBuilder: (_, index) {
        return DefaultCard(
          child: Shimmer.fromColors(
            baseColor: UIColors.shimmerBaseGrey,
            highlightColor: UIColors.shimmerHighlightGrey,
            child: Row(
              children: const [
                ShimmerItem(
                  height: 36,
                  width: 36,
                ),
                HorizontalSpacer(width: 16),
                Expanded(
                  child: ShimmerItem(
                    height: 16,
                    width: 100,
                  ),
                ),
                Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        );
      },
    );
  }
}
