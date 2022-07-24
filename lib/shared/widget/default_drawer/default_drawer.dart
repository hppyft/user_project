import 'package:flutter/material.dart';
import 'package:user_project/shared/const/ui_colors.dart';
import 'package:user_project/shared/widget/default_drawer/default_drawer_item.dart';
import 'package:user_project/shared/widget/horizontal_spacer.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

class DefaultDrawer extends StatelessWidget {
  final List<DefaultDrawerItem> items;

  const DefaultDrawer({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: UIColors.drawerBlue,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 16),
                width: double.infinity,
                color: UIColors.white,
                child: Row(
                  children: [
                    Image.asset('assets/png/flutter_logo.png',
                        fit: BoxFit.scaleDown),
                    const HorizontalSpacer(width: 16),
                    const Expanded(
                      child: Text(
                        'User Project',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIColors.drawerBlue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const VerticalSpacer(height: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  DefaultDrawerItem item = items[index];
                  return GestureDetector(
                    onTap: () => item.onPressed(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            color: UIColors.white,
                            size: 32,
                          ),
                          const HorizontalSpacer(width: 16),
                          Text(
                            item.text,
                            style: const TextStyle(
                              color: UIColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
