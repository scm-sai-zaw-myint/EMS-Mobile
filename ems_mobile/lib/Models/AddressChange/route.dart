class Route {
  int? addressChangeId;
  String fromRoute;
  String toRoute;
  int routeOrder;
  int? transportationId;
  String travelBy;
  bool? delFlg;
  double fees;

  Route({
    this.addressChangeId,
    required this.fromRoute,
    required this.toRoute,
    required this.routeOrder,
    this.transportationId,
    required this.fees,
    required this.travelBy,
    this.delFlg,
  });

  Route.empty()
      : fromRoute = "",
        toRoute = "",
        routeOrder = 0,
        travelBy = "",
        fees = 0.0,
        delFlg = false;

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      addressChangeId: json['address_change_id'],
      fromRoute: json['from_route'],
      toRoute: json['to_route'],
      routeOrder: json['route_order'],
      fees: json['fees'],
      travelBy: json['travelBy'],
      delFlg: json['del_flg'],
      transportationId: json['transportation_id'],
    );
  }

  static Map<String, dynamic> toJson(Route route) {
    return {
      "fromRoute": route.fromRoute,
      "toRoute": route.toRoute,
      "routeOrder": route.routeOrder,
      "fees": route.fees,
      "travelBy": route.travelBy,
      "delFlg": false
    };
  }
}
