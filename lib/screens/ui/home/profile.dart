import 'package:cashier_app_ui/component/texts/group_title.dart';
import 'package:flutter/material.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal : 24, vertical: 12),
      width: double.infinity,
      child: const Row(
        children: [
          ProfileIcon(),
          GroupedTitle(
            title: 'Dimas Bayu Sampurno',
            subtitle: 'Good Night',
            reverse: true,
          ),
          Spacer(),
          NotificationIcon(notificationCount: 1),
        ],
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/image/profile.png')),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  final int notificationCount;

  const NotificationIcon({super.key, this.notificationCount = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.notifications,
              size: 24,
              color: Colors.black,
            ),
          ),
          if (notificationCount > 0)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                ),
                child: Text(
                  notificationCount.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
