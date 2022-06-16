import 'dart:convert';

// List<ListElement> getListElementFromJson(String str) =>
//     List<ListElement>.from(json.decode(str).map((x) => ListElement.fromJson(x)));

// String getListElementToJson(List<ListElement> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

ListElement listElementFromJson(String str) => ListElement.fromJson(json.decode(str));

String listElementToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.message,
    this.object,
    required this.list,
    required this.status,
    required this.totalElements,
    required this.totalPages,
  });

  final String message;
  final dynamic object;
  final List<ListElement> list;
  final bool status;
  final int totalElements;
  final int totalPages;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        object: json["object"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        status: json["status"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "object": object,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "status": status,
        "totalElements": totalElements,
        "totalPages": totalPages,
      };
}

class ListElement {
  ListElement({
    required this.id,
    this.name,
    this.updatedBy,
    this.createdBy,
    required this.createdDate,
    this.pageSize,
    required this.status,
    this.resourceLink,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.classType,
    required this.year,
    required this.specialization,
    required this.duration,
    required this.effectiveDate,
    this.batchId,
    this.groupDto,
    this.courseDto,
    required this.moduleDto,
    required this.userDto,
    required this.roomDto,
    required this.groupList,
    this.groups,
    this.courseId,
    this.routineDate,
    this.startTimeResp,
    this.endTimeResp,
    this.teacherDto,
    this.previousRoutineId,
    this.dateOf,
    this.block,
    this.course,
    this.intake,
    required this.routineBatch,
  });

  final int id;
  final dynamic name;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdDate;
  final dynamic pageSize;
  final dynamic status;
  final dynamic resourceLink;
  final String day;
  final String startTime;
  final String endTime;
  final String classType;
  final String year;
  final String specialization;
  final String duration;
  final DateTime effectiveDate;
  final dynamic batchId;
  final dynamic groupDto;
  final dynamic courseDto;
  final ModuleDto moduleDto;
  final UserDto userDto;
  final ModuleDto roomDto;
  final List<ModuleDto> groupList;
  final dynamic groups;
  final dynamic courseId;
  final dynamic routineDate;
  final dynamic startTimeResp;
  final dynamic endTimeResp;
  final dynamic teacherDto;
  final dynamic previousRoutineId;
  final dynamic dateOf;
  final dynamic block;
  final dynamic course;
  final dynamic intake;
  final dynamic routineBatch;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        pageSize: json["pageSize"],
        status: json["status"],
        resourceLink: json["resourceLink"],
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        classType: json["classType"],
        year: json["year"],
        specialization: json["specialization"],
        duration: json["duration"],
        effectiveDate: DateTime.parse(json["effectiveDate"]),
        batchId: json["batchId"],
        groupDto: json["groupDto"],
        courseDto: json["courseDto"],
        moduleDto: ModuleDto.fromJson(json["moduleDto"]),
        userDto: UserDto.fromJson(json["userDto"]),
        roomDto: ModuleDto.fromJson(json["roomDto"]),
        groupList: List<ModuleDto>.from(
            json["groupList"].map((x) => ModuleDto.fromJson(x))),
        groups: json["groups"],
        courseId: json["courseId"],
        routineDate: json["routineDate"],
        startTimeResp: json["startTimeResp"],
        endTimeResp: json["endTimeResp"],
        teacherDto: json["teacherDto"],
        previousRoutineId: json["previousRoutineId"],
        dateOf: json["dateOf"],
        block: json["block"],
        course: json["course"],
        intake: json["intake"],
        routineBatch: json["routineBatch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "pageSize": pageSize,
        "status": status,
        "resourceLink": resourceLink,
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "classType": classType,
        "year": year,
        "specialization": specialization,
        "duration": duration,
        "effectiveDate": effectiveDate.toIso8601String(),
        "batchId": batchId,
        "groupDto": groupDto,
        "courseDto": courseDto,
        "moduleDto": moduleDto.toJson(),
        "userDto": userDto.toJson(),
        "roomDto": roomDto.toJson(),
        "groupList": List<dynamic>.from(groupList.map((x) => x.toJson())),
        "groups": groups,
        "courseId": courseId,
        "routineDate": routineDate,
        "startTimeResp": startTimeResp,
        "endTimeResp": endTimeResp,
        "teacherDto": teacherDto,
        "previousRoutineId": previousRoutineId,
        "dateOf": dateOf,
        "block": block,
        "course": course,
        "intake": intake,
        "routineBatch": routineBatch,
      };
}

// enum ClassType { LECTURE }

// final classTypeValues = EnumValues({"Lecture": ClassType.LECTURE});

class ModuleDto {
  ModuleDto({
    required this.id,
    required this.name,
    this.updatedBy,
    this.createdBy,
    required this.createdDate,
    this.pageSize,
    required this.status,
    this.resourceLink,
    required this.groupCode,
    this.courseEntity,
    required this.code,
    this.teacherName,
    this.roomCode,
    required this.block,
  });

  final int id;
  final String name;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdDate;
  final dynamic pageSize;
  final String status;
  final dynamic resourceLink;
  final String groupCode;
  final dynamic courseEntity;
  final String code;
  final dynamic teacherName;
  final dynamic roomCode;
  final String block;

  factory ModuleDto.fromJson(Map<String, dynamic> json) => ModuleDto(
        id: json["id"],
        name: json["name"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        pageSize: json["pageSize"],
        status: json["status"],
        resourceLink: json["resourceLink"],
        groupCode: json["groupCode"] == null ? null : json["groupCode"],
        courseEntity: json["courseEntity"],
        code: json["code"] == null ? null : json["code"],
        teacherName: json["teacherName"],
        roomCode: json["roomCode"],
        block: json["block"] == null ? null : json["block"],
        // block: json["block"] == null ? null : blockValues.map[json["block"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "pageSize": pageSize,
        "status": status,
        "resourceLink": resourceLink,
        "groupCode": groupCode == null ? null : groupCode,
        "courseEntity": courseEntity,
        "code": code == null ? null : code,
        "teacherName": teacherName,
        "roomCode": roomCode,
        "block": block == null ? null : block,
      };
}

// enum Block { KUMARI }

// final blockValues = EnumValues({"Kumari": Block.KUMARI});

// enum Status { A }

// final statusValues = EnumValues({"A": Status.A});

// enum RoutineBatch { SPRING_CLASS_2022 }

// final routineBatchValues =
//     EnumValues({"Spring Class 2022": RoutineBatch.SPRING_CLASS_2022});

class UserDto {
  UserDto({
    required this.id,
    required this.name,
    this.updatedBy,
    this.createdBy,
    required this.createdDate,
    this.pageSize,
    required this.status,
    this.resourceLink,
    this.teacherId,
    this.email,
    this.contactNumber,
    this.attLogId,
    this.punchInDateTime,
    this.punchOutDateTime,
    this.routineId,
    this.deviceId,
  });

  final int id;
  final String name;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdDate;
  final dynamic pageSize;
  final String status;
  final dynamic resourceLink;
  final dynamic teacherId;
  final dynamic email;
  final dynamic contactNumber;
  final dynamic attLogId;
  final dynamic punchInDateTime;
  final dynamic punchOutDateTime;
  final dynamic routineId;
  final dynamic deviceId;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        pageSize: json["pageSize"],
        status: json["status"],
        resourceLink: json["resourceLink"],
        teacherId: json["teacherId"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        attLogId: json["attLogId"],
        punchInDateTime: json["punchInDateTime"],
        punchOutDateTime: json["punchOutDateTime"],
        routineId: json["routineId"],
        deviceId: json["deviceId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "pageSize": pageSize,
        "status": status,
        "resourceLink": resourceLink,
        "teacherId": teacherId,
        "email": email,
        "contactNumber": contactNumber,
        "attLogId": attLogId,
        "punchInDateTime": punchInDateTime,
        "punchOutDateTime": punchOutDateTime,
        "routineId": routineId,
        "deviceId": deviceId,
      };

  getList() {}
}

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }