// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Integral _$IntegralFromJson(Map<String, dynamic> json) => Integral(
      (json['coinCount'] as num).toInt(),
      json['rank'] as String,
      (json['userId'] as num).toInt(),
      json['username'] as String,
    );

Map<String, dynamic> _$IntegralToJson(Integral instance) => <String, dynamic>{
      'coinCount': instance.coinCount,
      'rank': instance.rank,
      'userId': instance.userId,
      'username': instance.username,
    };
