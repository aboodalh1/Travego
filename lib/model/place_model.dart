class PlaceModel {
  PlaceModel({
      this.type, 
      this.features,});

  PlaceModel.fromJson(dynamic json) {
    type = json['type'];
    if (json['features'] != null) {
      features = [];
      json['features'].forEach((v) {
        features?.add(Features.fromJson(v));
      });
    }
  }
  String? type;
  List<Features>? features;
PlaceModel copyWith({  String? type,
  List<Features>? features,
}) => PlaceModel(  type: type ?? this.type,
  features: features ?? this.features,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (features != null) {
      map['features'] = features?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Features {
  Features({
      this.type, 
      this.properties, 
      this.geometry,});

  Features.fromJson(dynamic json) {
    type = json['type'];
    properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
  }
  String? type;
  Properties? properties;
  Geometry? geometry;
Features copyWith({  String? type,
  Properties? properties,
  Geometry? geometry,
}) => Features(  type: type ?? this.type,
  properties: properties ?? this.properties,
  geometry: geometry ?? this.geometry,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (properties != null) {
      map['properties'] = properties?.toJson();
    }
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    return map;
  }

}

class Geometry {
  Geometry({
      this.type, 
      this.coordinates,});

  Geometry.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? type;
  List<num>? coordinates;
Geometry copyWith({  String? type,
  List<num>? coordinates,
}) => Geometry(  type: type ?? this.type,
  coordinates: coordinates ?? this.coordinates,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}

class Properties {
  Properties({
      this.name, 
      this.country, 
      this.countryCode, 
      this.state, 
      this.county, 
      this.city, 
      this.municipality, 
      this.postcode, 
      this.suburb, 
      this.street, 
      this.housenumber, 
      this.lon, 
      this.lat, 
      this.stateCode, 
      this.formatted, 
      this.addressLine1, 
      this.addressLine2, 
      this.categories, 
      this.details, 
      this.datasource, 
      this.website, 
      this.openingHours, 
      this.brand, 
      this.brandDetails, 
      this.operator, 
      this.operatorDetails, 
      this.refOther, 
      this.contact, 
      this.building, 
      this.commercial, 
      this.placeId,});

  Properties.fromJson(dynamic json) {
    name = json['name'];
    country = json['country'];
    countryCode = json['country_code'];
    state = json['state'];
    county = json['county'];
    city = json['city'];
    municipality = json['municipality'];
    postcode = json['postcode'];
    suburb = json['suburb'];
    street = json['street'];
    housenumber = json['housenumber'];
    lon = json['lon'];
    lat = json['lat'];
    stateCode = json['state_code'];
    formatted = json['formatted'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    details = json['details'] != null ? json['details'].cast<String>() : [];
    datasource = json['datasource'] != null ? Datasource.fromJson(json['datasource']) : null;
    website = json['website'];
    openingHours = json['opening_hours'];
    brand = json['brand'];
    brandDetails = json['brand_details'] != null ? BrandDetails.fromJson(json['brand_details']) : null;
    operator = json['operator'];
    operatorDetails = json['operator_details'] != null ? OperatorDetails.fromJson(json['operator_details']) : null;
    refOther = json['ref_other'] != null ? RefOther.fromJson(json['ref_other']) : null;
    contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    building = json['building'] != null ? Building.fromJson(json['building']) : null;
    commercial = json['commercial'] != null ? Commercial.fromJson(json['commercial']) : null;
    placeId = json['place_id'];
  }
  String? name;
  String? country;
  String? countryCode;
  String? state;
  String? county;
  String? city;
  String? municipality;
  String? postcode;
  String? suburb;
  String? street;
  String? housenumber;
  num? lon;
  num? lat;
  String? stateCode;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  List<String>? categories;
  List<String>? details;
  Datasource? datasource;
  String? website;
  String? openingHours;
  String? brand;
  BrandDetails? brandDetails;
  String? operator;
  OperatorDetails? operatorDetails;
  RefOther? refOther;
  Contact? contact;
  Building? building;
  Commercial? commercial;
  String? placeId;
Properties copyWith({  String? name,
  String? country,
  String? countryCode,
  String? state,
  String? county,
  String? city,
  String? municipality,
  String? postcode,
  String? suburb,
  String? street,
  String? housenumber,
  num? lon,
  num? lat,
  String? stateCode,
  String? formatted,
  String? addressLine1,
  String? addressLine2,
  List<String>? categories,
  List<String>? details,
  Datasource? datasource,
  String? website,
  String? openingHours,
  String? brand,
  BrandDetails? brandDetails,
  String? operator,
  OperatorDetails? operatorDetails,
  RefOther? refOther,
  Contact? contact,
  Building? building,
  Commercial? commercial,
  String? placeId,
}) => Properties(  name: name ?? this.name,
  country: country ?? this.country,
  countryCode: countryCode ?? this.countryCode,
  state: state ?? this.state,
  county: county ?? this.county,
  city: city ?? this.city,
  municipality: municipality ?? this.municipality,
  postcode: postcode ?? this.postcode,
  suburb: suburb ?? this.suburb,
  street: street ?? this.street,
  housenumber: housenumber ?? this.housenumber,
  lon: lon ?? this.lon,
  lat: lat ?? this.lat,
  stateCode: stateCode ?? this.stateCode,
  formatted: formatted ?? this.formatted,
  addressLine1: addressLine1 ?? this.addressLine1,
  addressLine2: addressLine2 ?? this.addressLine2,
  categories: categories ?? this.categories,
  details: details ?? this.details,
  datasource: datasource ?? this.datasource,
  website: website ?? this.website,
  openingHours: openingHours ?? this.openingHours,
  brand: brand ?? this.brand,
  brandDetails: brandDetails ?? this.brandDetails,
  operator: operator ?? this.operator,
  operatorDetails: operatorDetails ?? this.operatorDetails,
  refOther: refOther ?? this.refOther,
  contact: contact ?? this.contact,
  building: building ?? this.building,
  commercial: commercial ?? this.commercial,
  placeId: placeId ?? this.placeId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country'] = country;
    map['country_code'] = countryCode;
    map['state'] = state;
    map['county'] = county;
    map['city'] = city;
    map['municipality'] = municipality;
    map['postcode'] = postcode;
    map['suburb'] = suburb;
    map['street'] = street;
    map['housenumber'] = housenumber;
    map['lon'] = lon;
    map['lat'] = lat;
    map['state_code'] = stateCode;
    map['formatted'] = formatted;
    map['address_line1'] = addressLine1;
    map['address_line2'] = addressLine2;
    map['categories'] = categories;
    map['details'] = details;
    if (datasource != null) {
      map['datasource'] = datasource?.toJson();
    }
    map['website'] = website;
    map['opening_hours'] = openingHours;
    map['brand'] = brand;
    if (brandDetails != null) {
      map['brand_details'] = brandDetails?.toJson();
    }
    map['operator'] = operator;
    if (operatorDetails != null) {
      map['operator_details'] = operatorDetails?.toJson();
    }
    if (refOther != null) {
      map['ref_other'] = refOther?.toJson();
    }
    if (contact != null) {
      map['contact'] = contact?.toJson();
    }
    if (building != null) {
      map['building'] = building?.toJson();
    }
    if (commercial != null) {
      map['commercial'] = commercial?.toJson();
    }
    map['place_id'] = placeId;
    return map;
  }

}

class Commercial {
  Commercial({
      this.type,});

  Commercial.fromJson(dynamic json) {
    type = json['type'];
  }
  String? type;
Commercial copyWith({  String? type,
}) => Commercial(  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    return map;
  }

}

class Building {
  Building({
      this.type,});

  Building.fromJson(dynamic json) {
    type = json['type'];
  }
  String? type;
Building copyWith({  String? type,
}) => Building(  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    return map;
  }

}

class Contact {
  Contact({
      this.phone,});

  Contact.fromJson(dynamic json) {
    phone = json['phone'];
  }
  String? phone;
Contact copyWith({  String? phone,
}) => Contact(  phone: phone ?? this.phone,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    return map;
  }

}

class RefOther {
  RefOther({
      this.walmart,});

  RefOther.fromJson(dynamic json) {
    walmart = json['walmart'];
  }
  num? walmart;
RefOther copyWith({  num? walmart,
}) => RefOther(  walmart: walmart ?? this.walmart,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['walmart'] = walmart;
    return map;
  }

}

class OperatorDetails {
  OperatorDetails({
      this.wikidata, 
      this.wikipedia,});

  OperatorDetails.fromJson(dynamic json) {
    wikidata = json['wikidata'];
    wikipedia = json['wikipedia'];
  }
  String? wikidata;
  String? wikipedia;
OperatorDetails copyWith({  String? wikidata,
  String? wikipedia,
}) => OperatorDetails(  wikidata: wikidata ?? this.wikidata,
  wikipedia: wikipedia ?? this.wikipedia,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wikidata'] = wikidata;
    map['wikipedia'] = wikipedia;
    return map;
  }

}

class BrandDetails {
  BrandDetails({
      this.wikidata,});

  BrandDetails.fromJson(dynamic json) {
    wikidata = json['wikidata'];
  }
  String? wikidata;
BrandDetails copyWith({  String? wikidata,
}) => BrandDetails(  wikidata: wikidata ?? this.wikidata,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wikidata'] = wikidata;
    return map;
  }

}

class Datasource {
  Datasource({
      this.sourcename, 
      this.attribution, 
      this.license, 
      this.url, 
      this.raw,});

  Datasource.fromJson(dynamic json) {
    sourcename = json['sourcename'];
    attribution = json['attribution'];
    license = json['license'];
    url = json['url'];
    raw = json['raw'] != null ? Raw.fromJson(json['raw']) : null;
  }
  String? sourcename;
  String? attribution;
  String? license;
  String? url;
  Raw? raw;
Datasource copyWith({  String? sourcename,
  String? attribution,
  String? license,
  String? url,
  Raw? raw,
}) => Datasource(  sourcename: sourcename ?? this.sourcename,
  attribution: attribution ?? this.attribution,
  license: license ?? this.license,
  url: url ?? this.url,
  raw: raw ?? this.raw,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sourcename'] = sourcename;
    map['attribution'] = attribution;
    map['license'] = license;
    map['url'] = url;
    if (raw != null) {
      map['raw'] = raw?.toJson();
    }
    return map;
  }

}

class Raw {
  Raw({
      this.name, 
      this.shop, 
      this.brand, 
      this.phone, 
      this.osmId, 
      this.website, 
      this.building, 
      this.operator, 
      this.osmType, 
      this.addrcity, 
      this.addrstate, 
      this.addrstreet, 
      this.refwalmart, 
      this.addrcountry, 
      this.addrpostcode, 
      this.openingHours, 
      this.brandwikidata, 
      this.addrhousenumber, 
      this.operatorwikidata, 
      this.operatorwikipedia,});

  Raw.fromJson(dynamic json) {
    name = json['name'];
    shop = json['shop'];
    brand = json['brand'];
    phone = json['phone'];
    osmId = json['osm_id'];
    website = json['website'];
    building = json['building'];
    operator = json['operator'];
    osmType = json['osm_type'];
    addrcity = json['addr:city'];
    addrstate = json['addr:state'];
    addrstreet = json['addr:street'];
    refwalmart = json['ref:walmart'];
    addrcountry = json['addr:country'];
    addrpostcode = json['addr:postcode'];
    openingHours = json['opening_hours'];
    brandwikidata = json['brand:wikidata'];
    addrhousenumber = json['addr:housenumber'];
    operatorwikidata = json['operator:wikidata'];
    operatorwikipedia = json['operator:wikipedia'];
  }
  String? name;
  String? shop;
  String? brand;
  String? phone;
  num? osmId;
  String? website;
  String? building;
  String? operator;
  String? osmType;
  String? addrcity;
  String? addrstate;
  String? addrstreet;
  num? refwalmart;
  String? addrcountry;
  num? addrpostcode;
  String? openingHours;
  String? brandwikidata;
  num? addrhousenumber;
  String? operatorwikidata;
  String? operatorwikipedia;
Raw copyWith({  String? name,
  String? shop,
  String? brand,
  String? phone,
  num? osmId,
  String? website,
  String? building,
  String? operator,
  String? osmType,
  String? addrcity,
  String? addrstate,
  String? addrstreet,
  num? refwalmart,
  String? addrcountry,
  num? addrpostcode,
  String? openingHours,
  String? brandwikidata,
  num? addrhousenumber,
  String? operatorwikidata,
  String? operatorwikipedia,
}) => Raw(  name: name ?? this.name,
  shop: shop ?? this.shop,
  brand: brand ?? this.brand,
  phone: phone ?? this.phone,
  osmId: osmId ?? this.osmId,
  website: website ?? this.website,
  building: building ?? this.building,
  operator: operator ?? this.operator,
  osmType: osmType ?? this.osmType,
  addrcity: addrcity ?? this.addrcity,
  addrstate: addrstate ?? this.addrstate,
  addrstreet: addrstreet ?? this.addrstreet,
  refwalmart: refwalmart ?? this.refwalmart,
  addrcountry: addrcountry ?? this.addrcountry,
  addrpostcode: addrpostcode ?? this.addrpostcode,
  openingHours: openingHours ?? this.openingHours,
  brandwikidata: brandwikidata ?? this.brandwikidata,
  addrhousenumber: addrhousenumber ?? this.addrhousenumber,
  operatorwikidata: operatorwikidata ?? this.operatorwikidata,
  operatorwikipedia: operatorwikipedia ?? this.operatorwikipedia,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['shop'] = shop;
    map['brand'] = brand;
    map['phone'] = phone;
    map['osm_id'] = osmId;
    map['website'] = website;
    map['building'] = building;
    map['operator'] = operator;
    map['osm_type'] = osmType;
    map['addr:city'] = addrcity;
    map['addr:state'] = addrstate;
    map['addr:street'] = addrstreet;
    map['ref:walmart'] = refwalmart;
    map['addr:country'] = addrcountry;
    map['addr:postcode'] = addrpostcode;
    map['opening_hours'] = openingHours;
    map['brand:wikidata'] = brandwikidata;
    map['addr:housenumber'] = addrhousenumber;
    map['operator:wikidata'] = operatorwikidata;
    map['operator:wikipedia'] = operatorwikipedia;
    return map;
  }

}