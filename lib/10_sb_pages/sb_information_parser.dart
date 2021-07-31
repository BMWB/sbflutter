/*
 * @Author: wangtianji
 * @Date: 2021-07-31 10:06:59
 * @LastEditTime: 2021-07-31 14:11:07
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/10_sb_pages/sb_information_parser.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'sb_route_path.dart';

class SBRouteInformationParser extends RouteInformationParser<SBRoutePath> {
  @override
  Future<SBRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    print("parseRouteInformation");
    final uri = Uri.parse(routeInformation.location!);

    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return SynchronousFuture(SBRoutePath.home());
    }

    // Handle '/sb/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'sb')
        return SynchronousFuture(SBRoutePath.unknown());
      var remaining = uri.pathSegments[1];
      var id = remaining;
      if (id == null) return SynchronousFuture(SBRoutePath.unknown());
      return SynchronousFuture(SBRoutePath.details(id));
    }

    // Handle unknown routes
    return SynchronousFuture(SBRoutePath.unknown());
  }
}

@override
RouteInformation? restoreRouteInformation(SBRoutePath path) {
  print("restoreRouteInformation");
  if (path.isUnknown) {
    return RouteInformation(location: '/404');
  }
  if (path.isHomePage) {
    return RouteInformation(location: '/');
  }
  if (path.isDetailsPage) {
    return RouteInformation(location: '/sb${path.route}');
  }
  return null;
}
