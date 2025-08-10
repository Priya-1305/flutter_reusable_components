import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/theme.dart';
import '../../../core/utils/responsive.dart';
import '../../components/components.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX UI Kit'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(child: AppBadge('v1.0.0')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Buttons & State',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const AppGap.h(12),
                  Obx(
                    () => AppText(
                      'Counter: ${controller.counter.value}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const AppGap.h(12),
                  Row(
                    children: [
                      AppButton(
                        label: 'Increment',
                        leading: Icons.add,
                        onPressed: controller.inc,
                      ),
                      const SizedBox(width: 12),
                      Obx(
                        () => AppButton(
                          label: 'Loading',
                          outline: true,
                          loading: controller.isLoading.value,
                          onPressed: () async {
                            controller.wrapLoading(
                              () async =>
                                  Future.delayed(const Duration(seconds: 1)),
                            );
                            AppSnack.success('Done!');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const AppGap.h(16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Text Field & Debounce',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const AppGap.h(12),
                  AppTextField(
                    hint: 'Search...',
                    controller: searchCtrl,
                    prefix: const Icon(Icons.search),
                    onChanged: controller.onSearchChanged,
                  ),
                  const AppGap.h(8),
                  Obx(
                    () => AppText(
                      'Query: ${controller.query.value.isEmpty ? "(typing…)" : controller.query.value}',
                    ),
                  ),
                ],
              ),
            ),
            const AppGap.h(16),
            const AppText(
              'List Tiles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const AppGap.h(8),
            AppListTile(
              title: 'Profile',
              subtitle: 'Edit your information',
              leading: Icons.person_rounded,
              onTap: () => AppDialog.show(
                title: 'Profile',
                message: 'Navigate to profile page?',
              ),
            ),
            const AppGap.h(8),
            AppListTile(
              title: 'Notifications',
              subtitle: 'Customize alerts',
              leading: Icons.notifications_rounded,
              trailing: Switch(value: true, onChanged: (_) {}),
            ),
            const AppGap.h(16),
            const AppText(
              'Skeleton / Shimmer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const AppGap.h(8),
            const AppShimmer(height: 14, width: 220),
            const AppGap.h(8),
            const AppShimmer(height: 14, width: 160),
            const AppGap.h(8),
            const AppShimmer(
              height: 100,
              radius: BorderRadius.all(Radius.circular(16)),
            ),
            const AppGap.h(16),
            ResponsiveBox(
              mobile: AppCard(child: const AppText('Mobile layout 👇')),
              tablet: AppCard(child: const AppText('Tablet layout 👇')),
              desktop: AppCard(child: const AppText('Desktop layout 👇')),
            ),
            const AppGap.h(64),
            Center(
              child: Text(
                'Made with GetX • ${DateTime.now().year}',
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppSnack.success('Hello from FAB!'),
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.check),
      ),
    );
  }
}
