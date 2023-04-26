class AddressChangeRoute {
  int? addressChangeId;
  String fromRoute;
  String toRoute;
  int routeOrder;
  int? transportationId;
  String travelBy;
  bool? delFlg;
  double fees;

  AddressChangeRoute({
    this.addressChangeId,
    required this.fromRoute,
    required this.toRoute,
    required this.routeOrder,
    this.transportationId,
    required this.fees,
    required this.travelBy,
    this.delFlg,
  });

  AddressChangeRoute.empty()
      : fromRoute = "",
        toRoute = "",
        routeOrder = 0,
        travelBy = "",
        fees = 0.0,
        delFlg = false;

  factory AddressChangeRoute.fromJson(Map<String, dynamic> json) {
    return AddressChangeRoute(
      addressChangeId: json['address_change_id'],
      fromRoute: json['from_route'],
      toRoute: json['to_route'],
      routeOrder: json['route_order'],
      fees: json['fees'],
      travelBy: json['travel_by'],
      delFlg: json['del_flg'],
      transportationId: json['transportation_id'],
    );
  }

  static Map<String, dynamic> toJson(AddressChangeRoute route) {
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
