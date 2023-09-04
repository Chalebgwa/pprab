class CompanyAddressModel {
  final String country;
  final String city;
  final String district;
  final String plot;
  final String street;

  CompanyAddressModel({
    required this.country,
    required this.city,
    required this.district,
    required this.plot,
    required this.street,
  });

  Map<String, dynamic> toJson() => {
        'country': country,
        'city': city,
        'district': district,
        'plot': plot,
        'street': street,
      };
  // from json
  factory CompanyAddressModel.fromJson(Map<String, dynamic> json) {
    return CompanyAddressModel(
      country: json['country'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      plot: json['plot'] as String,
      street: json['street'] as String,
    );
  }
}
