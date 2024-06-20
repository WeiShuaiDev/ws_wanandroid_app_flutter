// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleInfo _$ArticleInfoFromJson(Map<String, dynamic> json) => ArticleInfo(
      (json['curPage'] as num).toInt(),
      (json['datas'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['offset'] as num).toInt(),
      json['over'] as bool,
      (json['pageCount'] as num).toInt(),
      (json['size'] as num).toInt(),
      (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$ArticleInfoToJson(ArticleInfo instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      json['adminAdd'] as bool,
      json['apkLink'] as String,
      (json['audit'] as num).toInt(),
      json['author'] as String,
      json['canEdit'] as bool,
      (json['chapterId'] as num).toInt(),
      json['chapterName'] as String,
      json['collect'] as bool,
      (json['courseId'] as num).toInt(),
      json['desc'] as String,
      json['descMd'] as String,
      json['envelopePic'] as String,
      json['fresh'] as bool,
      json['host'] as String,
      (json['id'] as num).toInt(),
      json['isAdminAdd'] as bool,
      json['link'] as String,
      json['niceDate'] as String,
      json['niceShareDate'] as String,
      json['origin'] as String,
      json['prefix'] as String,
      json['projectLink'] as String,
      (json['publishTime'] as num).toInt(),
      (json['realSuperChapterId'] as num).toInt(),
      (json['selfVisible'] as num).toInt(),
      (json['shareDate'] as num).toInt(),
      json['shareUser'] as String,
      (json['superChapterId'] as num).toInt(),
      json['superChapterName'] as String,
      (json['tags'] as List<dynamic>)
          .map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String,
      (json['type'] as num).toInt(),
      (json['userId'] as num).toInt(),
      (json['visible'] as num).toInt(),
      (json['zan'] as num).toInt(),
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'adminAdd': instance.adminAdd,
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'host': instance.host,
      'id': instance.id,
      'isAdminAdd': instance.isAdminAdd,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'realSuperChapterId': instance.realSuperChapterId,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
