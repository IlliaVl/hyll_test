class Feed {
  final int? count;
  final String? next;
  final String? previous;
  final List<Adventure>? adventures;

  Feed({
    this.count,
    this.next,
    this.previous,
    this.adventures,
  });

  Feed copyWith({
    int? count,
    String? next,
    String? previous,
    List<Adventure>? adventures,
  }) =>
      Feed(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        adventures: adventures ?? this.adventures,
      );

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        adventures: json["data"] == null
            ? []
            : List<Adventure>.from(
                json["data"]!.map((x) => Adventure.fromJson(x))),
      );
}

class Adventure {
  final int? id;
  final int? pk;
  final String? status;
  final String? title;
  final Location? areaLocation;
  final Location? startingLocation;
  final List<String>? tags;
  final String? activity;
  final int? activityId;
  final String? primaryImage;
  final String? primaryVideo;
  final String? thumbnail;
  final String? activityIcon;
  final List<Badge>? badges;
  final int? bucketListCount;
  final List<Content>? contents;
  final SupplyInfo? supplyInfo;
  final List<GridInfo>? gridInfo;
  final bool? ticketOptional;
  final List<dynamic>? bookedByFollowing;
  final String? primaryDescription;
  final String? description;
  final List<Fact>? facts;

  Adventure({
    this.id,
    this.pk,
    this.status,
    this.title,
    this.areaLocation,
    this.startingLocation,
    this.tags,
    this.activity,
    this.activityId,
    this.primaryImage,
    this.primaryVideo,
    this.thumbnail,
    this.activityIcon,
    this.badges,
    this.bucketListCount,
    this.contents,
    this.supplyInfo,
    this.gridInfo,
    this.ticketOptional,
    this.bookedByFollowing,
    this.primaryDescription,
    this.description,
    this.facts,
  });

  Adventure copyWith({
    int? id,
    int? pk,
    String? status,
    String? title,
    Location? areaLocation,
    Location? startingLocation,
    List<String>? tags,
    String? activity,
    int? activityId,
    String? primaryImage,
    String? primaryVideo,
    String? thumbnail,
    String? activityIcon,
    List<Badge>? badges,
    int? bucketListCount,
    List<Content>? contents,
    SupplyInfo? supplyInfo,
    List<GridInfo>? gridInfo,
    bool? ticketOptional,
    List<dynamic>? bookedByFollowing,
    String? primaryDescription,
    String? description,
    List<Fact>? facts,
  }) =>
      Adventure(
        id: id ?? this.id,
        pk: pk ?? this.pk,
        status: status ?? this.status,
        title: title ?? this.title,
        areaLocation: areaLocation ?? this.areaLocation,
        startingLocation: startingLocation ?? this.startingLocation,
        tags: tags ?? this.tags,
        activity: activity ?? this.activity,
        activityId: activityId ?? this.activityId,
        primaryImage: primaryImage ?? this.primaryImage,
        primaryVideo: primaryVideo ?? this.primaryVideo,
        thumbnail: thumbnail ?? this.thumbnail,
        activityIcon: activityIcon ?? this.activityIcon,
        badges: badges ?? this.badges,
        bucketListCount: bucketListCount ?? this.bucketListCount,
        contents: contents ?? this.contents,
        supplyInfo: supplyInfo ?? this.supplyInfo,
        gridInfo: gridInfo ?? this.gridInfo,
        ticketOptional: ticketOptional ?? this.ticketOptional,
        bookedByFollowing: bookedByFollowing ?? this.bookedByFollowing,
        primaryDescription: primaryDescription ?? this.primaryDescription,
        description: description ?? this.description,
        facts: facts ?? this.facts,
      );

  factory Adventure.fromJson(Map<String, dynamic> json) => Adventure(
        id: json["id"],
        pk: json["pk"],
        status: json["status"],
        title: json["title"],
        areaLocation: json["area_location"] == null
            ? null
            : Location.fromJson(json["area_location"]),
        startingLocation: json["starting_location"] == null
            ? null
            : Location.fromJson(json["starting_location"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        activity: json["activity"],
        activityId: json["activity_id"],
        primaryImage: json["primary_image"],
        primaryVideo: json["primary_video"],
        thumbnail: json["thumbnail"],
        activityIcon: json["activity_icon"],
        badges: json["badges"] == null
            ? []
            : List<Badge>.from(json["badges"]!.map((x) => Badge.fromJson(x))),
        bucketListCount: json["bucket_list_count"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromJson(x))),
        supplyInfo: json["supply_info"] == null
            ? null
            : SupplyInfo.fromJson(json["supply_info"]),
        gridInfo: json["grid_info"] == null
            ? []
            : List<GridInfo>.from(
                json["grid_info"]!.map((x) => GridInfo.fromJson(x))),
        ticketOptional: json["ticket_optional"],
        bookedByFollowing: json["booked_by_following"] == null
            ? []
            : List<dynamic>.from(json["booked_by_following"]!.map((x) => x)),
        primaryDescription: json["primary_description"],
        description: json["description"],
        facts: json["facts"] == null
            ? []
            : List<Fact>.from(json["facts"]!.map((x) => Fact.fromJson(x))),
      );
}

class Location {
  final String? name;
  final dynamic subtitle;
  final dynamic distance;
  final dynamic imageUrl;

  Location({
    this.name,
    this.subtitle,
    this.distance,
    this.imageUrl,
  });

  Location copyWith({
    String? name,
    dynamic subtitle,
    dynamic distance,
    dynamic imageUrl,
  }) =>
      Location(
        name: name ?? this.name,
        subtitle: subtitle ?? this.subtitle,
        distance: distance ?? this.distance,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        subtitle: json["subtitle"],
        distance: json["distance"],
        imageUrl: json["image_url"],
      );
}

class Badge {
  final String? title;
  final String? icon;
  final String? colorScheme;

  Badge({
    this.title,
    this.icon,
    this.colorScheme,
  });

  Badge copyWith({
    String? title,
    String? icon,
    String? colorScheme,
  }) =>
      Badge(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        colorScheme: colorScheme ?? this.colorScheme,
      );

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        title: json["title"],
        icon: json["icon"],
        colorScheme: json["color_scheme"],
      );
}

class Content {
  final String? id;
  final ContentType? contentType;
  final ContentMode? contentMode;
  final String? contentUrl;
  final ContentSource? contentSource;
  final bool? isHeaderForThePlan;
  final bool? isPrivate;

  Content({
    this.id,
    this.contentType,
    this.contentMode,
    this.contentUrl,
    this.contentSource,
    this.isHeaderForThePlan,
    this.isPrivate,
  });

  Content copyWith({
    String? id,
    ContentType? contentType,
    ContentMode? contentMode,
    String? contentUrl,
    ContentSource? contentSource,
    bool? isHeaderForThePlan,
    bool? isPrivate,
  }) =>
      Content(
        id: id ?? this.id,
        contentType: contentType ?? this.contentType,
        contentMode: contentMode ?? this.contentMode,
        contentUrl: contentUrl ?? this.contentUrl,
        contentSource: contentSource ?? this.contentSource,
        isHeaderForThePlan: isHeaderForThePlan ?? this.isHeaderForThePlan,
        isPrivate: isPrivate ?? this.isPrivate,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        contentType: contentTypeValues.map[json["content_type"]],
        contentMode: contentModeValues.map[json["content_mode"]],
        contentUrl: json["content_url"],
        contentSource: json["content_source"] == null
            ? null
            : ContentSource.fromJson(json["content_source"]),
        isHeaderForThePlan: json["is_header_for_the_plan"],
        isPrivate: json["is_private"],
      );
}

enum ContentMode {
  adventurePrimaryImage,
  adventureGallery,
  adventurePrimaryVideo,
  adventureStaticMap
}

final contentModeValues = EnumValues({
  "ADVENTURE_GALLERY": ContentMode.adventureGallery,
  "ADVENTURE_PRIMARY_IMAGE": ContentMode.adventurePrimaryImage,
  "ADVENTURE_PRIMARY_VIDEO": ContentMode.adventurePrimaryVideo,
  "ADVENTURE_STATIC_MAP": ContentMode.adventureStaticMap
});

class ContentSource {
  final String? id;
  final String? title;
  final String? author;
  final String? name;
  final dynamic icon;
  final String? url;
  final dynamic creator;

  ContentSource({
    this.id,
    this.title,
    this.author,
    this.name,
    this.icon,
    this.url,
    this.creator,
  });

  ContentSource copyWith({
    String? id,
    String? title,
    String? author,
    String? name,
    dynamic icon,
    String? url,
    dynamic creator,
  }) =>
      ContentSource(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        url: url ?? this.url,
        creator: creator ?? this.creator,
      );

  factory ContentSource.fromJson(Map<String, dynamic> json) => ContentSource(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        name: json["name"],
        icon: json["icon"],
        url: json["url"],
        creator: json["creator"],
      );
}

enum ContentType { image, video }

final contentTypeValues =
    EnumValues({"IMAGE": ContentType.image, "VIDEO": ContentType.video});

class Fact {
  final String? name;
  final String? value;
  final String? unit;
  final String? iconUrl;
  final String? displaySection;
  final int? factDefinitionId;
  final int? adventureFactId;
  final dynamic backgroundColor;
  final dynamic iconColor;
  final dynamic textColor;

  Fact({
    this.name,
    this.value,
    this.unit,
    this.iconUrl,
    this.displaySection,
    this.factDefinitionId,
    this.adventureFactId,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  });

  Fact copyWith({
    String? name,
    String? value,
    String? unit,
    String? iconUrl,
    String? displaySection,
    int? factDefinitionId,
    int? adventureFactId,
    dynamic backgroundColor,
    dynamic iconColor,
    dynamic textColor,
  }) =>
      Fact(
        name: name ?? this.name,
        value: value ?? this.value,
        unit: unit ?? this.unit,
        iconUrl: iconUrl ?? this.iconUrl,
        displaySection: displaySection ?? this.displaySection,
        factDefinitionId: factDefinitionId ?? this.factDefinitionId,
        adventureFactId: adventureFactId ?? this.adventureFactId,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        iconColor: iconColor ?? this.iconColor,
        textColor: textColor ?? this.textColor,
      );

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        name: json["name"],
        value: json["value"],
        unit: json["unit"],
        iconUrl: json["icon_url"],
        displaySection: json["display_section"],
        factDefinitionId: json["fact_definition_id"],
        adventureFactId: json["adventure_fact_id"],
        backgroundColor: json["background_color"],
        iconColor: json["icon_color"],
        textColor: json["text_color"],
      );
}

class GridInfo {
  final String? name;
  final String? value;
  final String? iconUrl;
  final String? schema;

  GridInfo({
    this.name,
    this.value,
    this.iconUrl,
    this.schema,
  });

  GridInfo copyWith({
    String? name,
    String? value,
    String? iconUrl,
    String? schema,
  }) =>
      GridInfo(
        name: name ?? this.name,
        value: value ?? this.value,
        iconUrl: iconUrl ?? this.iconUrl,
        schema: schema ?? this.schema,
      );

  factory GridInfo.fromJson(Map<String, dynamic> json) => GridInfo(
        name: json["name"],
        value: json["value"],
        iconUrl: json["icon_url"],
        schema: json["schema"],
      );
}

class SupplyInfo {
  final String? supplierName;
  final String? priceTitle;
  final String? priceSubtitle;
  final String? buttonType;
  final dynamic link;

  SupplyInfo({
    this.supplierName,
    this.priceTitle,
    this.priceSubtitle,
    this.buttonType,
    this.link,
  });

  SupplyInfo copyWith({
    String? supplierName,
    String? priceTitle,
    String? priceSubtitle,
    String? buttonType,
    dynamic link,
  }) =>
      SupplyInfo(
        supplierName: supplierName ?? this.supplierName,
        priceTitle: priceTitle ?? this.priceTitle,
        priceSubtitle: priceSubtitle ?? this.priceSubtitle,
        buttonType: buttonType ?? this.buttonType,
        link: link ?? this.link,
      );

  factory SupplyInfo.fromJson(Map<String, dynamic> json) => SupplyInfo(
        supplierName: json["supplier_name"],
        priceTitle: json["price_title"],
        priceSubtitle: json["price_subtitle"],
        buttonType: json["button_type"],
        link: json["link"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
