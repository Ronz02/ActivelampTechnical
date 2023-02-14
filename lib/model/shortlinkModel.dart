// To parse this JSON data, do
//
//     final shortLinkModels = shortLinkModelsFromJson(jsonString);

import 'dart:convert';

ShortLinkModels shortLinkModelsFromJson(String str) => ShortLinkModels.fromJson(json.decode(str));

String shortLinkModelsToJson(ShortLinkModels data) => json.encode(data.toJson());

class ShortLinkModels {
    ShortLinkModels({
        required this.data,
        required this.code,
        required this.errors,
    });

    Data data;
    int code;
    List<dynamic> errors;

    factory ShortLinkModels.fromJson(Map<String, dynamic> json) => ShortLinkModels(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "errors": List<dynamic>.from(errors.map((x) => x)),
    };
}

class Data {
    Data({
        required this.domain,
        required this.alias,
        required this.tinyUrl,
        required this.url,
    });

    String domain;
    String alias;
    String tinyUrl;
    String url;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        domain: json["domain"],
        alias: json["alias"],
        tinyUrl: json["tiny_url"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "domain": domain,
        "alias": alias,
        "tiny_url": tinyUrl,
        "url": url,
    };
}
