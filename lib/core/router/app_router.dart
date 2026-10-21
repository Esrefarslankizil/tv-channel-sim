import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_channel_sim/features/advertising/presentation/advertising_screen.dart';
import 'package:tv_channel_sim/features/content/presentation/content_screen.dart';
import 'package:tv_channel_sim/features/dashboard/presentation/dashboard_screen.dart';
import 'package:tv_channel_sim/features/debug/presentation/design_showcase_screen.dart';
import 'package:tv_channel_sim/features/finance/presentation/finance_screen.dart';
import 'package:tv_channel_sim/features/schedule/presentation/schedule_screen.dart';
import 'package:tv_channel_sim/features/staff/presentation/staff_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

Page<dynamic> _buildFadeSlidePage({required LocalKey key, required Widget child}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curvedAnimation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.03, 0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        ),
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/debug/showcase',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => _buildFadeSlidePage(
        key: state.pageKey,
        child: const DesignShowcaseScreen(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard_rounded),
                label: 'Ana Sayfa',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_view_week_outlined),
                selectedIcon: Icon(Icons.calendar_view_week_rounded),
                label: 'Yayin Akisi',
              ),
              NavigationDestination(
                icon: Icon(Icons.movie_filter_outlined),
                selectedIcon: Icon(Icons.movie_filter_rounded),
                label: 'Icerik',
              ),
              NavigationDestination(
                icon: Icon(Icons.badge_outlined),
                selectedIcon: Icon(Icons.badge_rounded),
                label: 'Personel',
              ),
              NavigationDestination(
                icon: Icon(Icons.campaign_outlined),
                selectedIcon: Icon(Icons.campaign_rounded),
                label: 'Reklam',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_balance_outlined),
                selectedIcon: Icon(Icons.account_balance_rounded),
                label: 'Finans',
              ),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => _buildFadeSlidePage(
                key: state.pageKey,
                child: const DashboardScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/schedule',
              pageBuilder: (context, state) => _buildFadeSlidePage(
                key: state.pageKey,
                child: const ScheduleScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/content',
              pageBuilder: (context, state) => _buildFadeSlidePage(
                key: state.pageKey,
                child: const ContentScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/staff',
              pageBuilder: (context, state) => _buildFadeSlidePage(
                key: state.pageKey,
                child: const StaffScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/advertising',
              pageBuilder: (context, state) => _buildFadeSlidePage(
                key: state.pageKey,
                child: const AdvertisingScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/finance',
              pageBuilder: (context, state) => _buildFadeSlidePage(
                key: state.pageKey,
                child: const FinanceScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);