// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_banner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexBannerInfo _$IndexBannerInfoFromJson(Map<String, dynamic> json) =>
    IndexBannerInfo(
      json['desc'] as String,
      (json['id'] as num).toInt(),
      json['imagePath'] as String,
      (json['isVisible'] as num).toInt(),
      (json['order'] as num).toInt(),
      json['title'] as String,
      (json['type'] as num).toInt(),
      json['url'] as String,
    );

Map<String, dynamic> _$IndexBannerInfoToJson(IndexBannerInfo instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
