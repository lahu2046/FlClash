import 'package:collection/collection.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/selector.freezed.dart';

@freezed
class StartButtonSelectorState with _$StartButtonSelectorState {
  const factory StartButtonSelectorState({
    required bool isInit,
    required bool hasProfile,
  }) = _StartButtonSelectorState;
}

@freezed
class ProfilesSelectorState with _$ProfilesSelectorState {
  const factory ProfilesSelectorState({
    required List<Profile> profiles,
    required String? currentProfileId,
    required int columns,
  }) = _ProfilesSelectorState;
}

@freezed
class NetworkDetectionState with _$NetworkDetectionState {
  const factory NetworkDetectionState({
    required bool isTesting,
    required IpInfo? ipInfo,
  }) = _NetworkDetectionState;
}

@freezed
class TrayState with _$TrayState {
  const factory TrayState({
    required Mode mode,
    required int port,
    required bool autoLaunch,
    required bool systemProxy,
    required bool tunEnable,
    required bool isStart,
    required String? locale,
    required Brightness? brightness,
    required List<Group> groups,
    required SelectedMap selectedMap,
  }) = _TrayState;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required PageLabel pageLabel,
    required List<NavigationItem> navigationItems,
    required ViewMode viewMode,
    required String? locale,
  }) = _HomeState;
}

@freezed
class ProxiesSelectorState with _$ProxiesSelectorState {
  const factory ProxiesSelectorState({
    required List<String> groupNames,
    required String? currentGroupName,
  }) = _ProxiesSelectorState;
}

@freezed
class GroupNamesState with _$GroupNamesState {
  const factory GroupNamesState({
    required List<String> groupNames,
  }) = _GroupNamesState;
}

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState({
    required List<Group> value,
  }) = _GroupsState;
}

@freezed
class NavigationItemsState with _$NavigationItemsState {
  const factory NavigationItemsState({
    required List<NavigationItem> value,
  }) = _NavigationItemsState;
}

@freezed
class ProxiesListSelectorState with _$ProxiesListSelectorState {
  const factory ProxiesListSelectorState({
    required List<String> groupNames,
    required Set<String> currentUnfoldSet,
    required ProxiesSortType proxiesSortType,
    required ProxyCardType proxyCardType,
    required num sortNum,
    required int columns,
  }) = _ProxiesListSelectorState;
}

@freezed
class ProxyGroupSelectorState with _$ProxyGroupSelectorState {
  const factory ProxyGroupSelectorState({
    required String? testUrl,
    required ProxiesSortType proxiesSortType,
    required ProxyCardType proxyCardType,
    required num sortNum,
    required GroupType groupType,
    required List<Proxy> proxies,
    required int columns,
  }) = _ProxyGroupSelectorState;
}

@freezed
class MoreToolsSelectorState with _$MoreToolsSelectorState {
  const factory MoreToolsSelectorState({
    required List<NavigationItem> navigationItems,
  }) = _MoreToolsSelectorState;
}

@freezed
class PackageListSelectorState with _$PackageListSelectorState {
  const factory PackageListSelectorState({
    required List<Package> packages,
    required AccessControl accessControl,
  }) = _PackageListSelectorState;
}

extension PackageListSelectorStateExt on PackageListSelectorState {
  List<Package> getList(List<String> selectedList) {
    final isFilterSystemApp = accessControl.isFilterSystemApp;
    final sort = accessControl.sort;
    return packages
        .where((item) => isFilterSystemApp ? item.isSystem == false : true)
        .sorted(
      (a, b) {
        return switch (sort) {
          AccessSortType.none => 0,
          AccessSortType.name => other.sortByChar(
              other.getPinyin(a.label),
              other.getPinyin(b.label),
            ),
          AccessSortType.time => b.lastUpdateTime.compareTo(a.lastUpdateTime),
        };
      },
    ).sorted(
      (a, b) {
        final isSelectA = selectedList.contains(a.packageName);
        final isSelectB = selectedList.contains(b.packageName);
        if (isSelectA && isSelectB) return 0;
        if (isSelectA) return -1;
        if (isSelectB) return 1;
        return 0;
      },
    );
  }
}

@freezed
class ProxiesListHeaderSelectorState with _$ProxiesListHeaderSelectorState {
  const factory ProxiesListHeaderSelectorState({
    required double offset,
    required int currentIndex,
  }) = _ProxiesListHeaderSelectorState;
}

@freezed
class ProxiesActionsState with _$ProxiesActionsState {
  const factory ProxiesActionsState({
    required PageLabel pageLabel,
    required ProxiesType type,
    required bool hasProviders,
  }) = _ProxiesActionsState;
}

@freezed
class ProxyState with _$ProxyState {
  const factory ProxyState({
    required bool isStart,
    required bool systemProxy,
    required List<String> bassDomain,
    required int port,
  }) = _ProxyState;
}

@freezed
class ClashConfigState with _$ClashConfigState {
  const factory ClashConfigState({
    required bool overrideDns,
    required ClashConfig clashConfig,
  }) = _ClashConfigState;
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required List<DashboardWidget> dashboardWidgets,
    required double viewWidth,
  }) = _DashboardState;
}

@freezed
class VpnState with _$VpnState {
  const factory VpnState({
    required TunStack stack,
    required VpnProps vpnProps,
  }) = _VpnState;
}
