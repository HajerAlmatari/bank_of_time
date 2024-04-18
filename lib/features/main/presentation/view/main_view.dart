import 'package:bank_off_time/features/chat/presentaions/views/chat_view.dart';
import 'package:bank_off_time/features/home/presentation/view/home_view.dart';
import 'package:bank_off_time/features/main/presentation/view/widgets/custom_bottom_nav_item.dart';
import 'package:bank_off_time/features/profile/presentation/view/profile_view.dart';
import 'package:bank_off_time/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

class MainView extends ConsumerWidget {
  static final List<Widget> _widgetOptions = <Widget>[
    const ProfileView(),
    const HomeView(),
    const SettingsView(),
    const ChatView(),
  ];
  MainView({super.key});

  final List<IconData> listOfIcons = [
    Icons.person,
    Icons.home_filled,
    Icons.settings,
    Icons.message,
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    return Scaffold(
      body: _widgetOptions[indexBottomNavbar],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: screenWidth * .140,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .01),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    ref.read(indexBottomNavbarProvider.notifier).update((state) => index);
                  },
                  child: CustomBottomNavItem(
                    currentIndex: indexBottomNavbar,
                    index: index,
                    iconData: listOfIcons[index],
                  ),
              );
            },
        ),
      ),
    );
  }
}
