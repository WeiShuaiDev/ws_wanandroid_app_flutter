// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_article_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxArticleChapter _$WxArticleChapterFromJson(Map<String, dynamic> json) =>
    WxArticleChapter(
      json['articleList'] as List<dynamic>,
      json['author'] as String,
      json['children'] as List<dynamic>,
      (json['courseId'] as num).toInt(),
      json['cover'] as String,
      json['desc'] as String,
      (json['id'] as num).toInt(),
      json['lisense'] as String,
      json['lisenseLink'] as String,
      json['name'] as String,
      (json['order'] as num).toInt(),
      (json['parentChapterId'] as num).toInt(),
      (json['type'] as num).toInt(),
      json['userControlSetTop'] as bool,
      (json['visible'] as num).toInt(),
    );

Map<String, dynamic> _$WxArticleChapterToJson(WxArticleChapter instance) =>
    <String, dynamic>{
      'articleList': instance.articleList,
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
