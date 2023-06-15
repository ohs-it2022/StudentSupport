// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      subject: json['subject'] as String,
      fullname: json['fullname'] as String,
      room: json['room'] as String,
      teacher: json['teacher'] as String,
    );

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'fullname': instance.fullname,
      'room': instance.room,
      'teacher': instance.teacher,
    };

ClassesModel _$ClassesModelFromJson(Map<String, dynamic> json) => ClassesModel(
      name: json['name'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassesModelToJson(ClassesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

TimeTableModel _$TimeTableModelFromJson(Map<String, dynamic> json) =>
    TimeTableModel(
      id: json['id'] as int,
      days: (json['days'] as List<dynamic>)
          .map((e) => ClassesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeTableModelToJson(TimeTableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'days': instance.days.map((e) => e.toJson()).toList(),
    };

TTsModel _$TTsModelFromJson(Map<String, dynamic> json) => TTsModel(
      (json['timetables'] as List<dynamic>)
          .map((e) => TimeTableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TTsModelToJson(TTsModel instance) => <String, dynamic>{
      'timetables': instance.timetables.map((e) => e.toJson()).toList(),
    };
