class Transportation {
  int? otherTransportationId;
  String? employeeId;
  String? employeeName;
  String? source;
  String? destination;
  String? travelBy;
  int? fees;
  String? travelType;
  String? status;
  String? travelDate;
  String? requestDate;
  String? approveDate;
  bool? delFlag;
  int? createdAt;
  int? updatedAt;
  String? description;
  String? remark;
  String? ferryAbsentDate;
  int? ferryId;
  List<int>? checks;

  Transportation.empty();

  Transportation(this.otherTransportationId,
      this.employeeId,
      this.employeeName,
      this.source,
      this.destination,
      this.travelBy,
      this.fees,
      this.travelType,
      this.status,
      this.travelDate,
      this.requestDate,
      this.approveDate,
      this.delFlag,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.remark,
      this.ferryAbsentDate,
      this.ferryId,
      this.checks);

  factory Transportation.fromJson(Map<String, dynamic> json){
    return Transportation(
        json["otherTransportationId"],
        json["employeeId"],
        json["employeeName"],
        json["source"],
        json["destination"],
        json["travelBy"],
        json["fees"],
        json["travelType"],
        json["status"],
        json["travelDate"],
        json["requestDate"],
        json["approveDate"],
        json["delFlag"],
        json["createdAt"],
        json["updatedAt"],
        json["description"],
        json["remark"],
        json["ferryAbsentDate"],
        json["ferryId"],
        json["checks"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "otherTransportationId":otherTransportationId,
      "employeeId":employeeId,
      "employeeName":employeeName,
      "source":source,
      "destination":destination,
      "travelBy":travelBy,
      "fees":fees,
      "travelType":travelType,
      "status":status,
      "travelDate":travelDate,
      "requestDate":requestDate,
      "approveDate":approveDate,
      "delFlag":delFlag,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "description":description,
      "remark":remark,
      "ferryAbsentDate":ferryAbsentDate,
      "ferryId":ferryId,
      "checks": checks
    };
  }
}