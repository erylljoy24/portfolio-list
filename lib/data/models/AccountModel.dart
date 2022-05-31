class AccountModel {
  String? name;
  String? imageUrl;
  String? description;
  String? accountnumber;
  int? statecode;
  String? address1_stateorprovince;
  String? error;

  AccountModel.withError(String errorMessage) {
    error = errorMessage;
  }

  AccountModel({
    this.name,
    this.imageUrl,
    this.description,
    this.accountnumber,
    this.statecode,
    this.address1_stateorprovince
  });

  AccountModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    imageUrl = json['entityimage_url'];
    description = json['description'];
    accountnumber = json['accountnumber'];
    statecode = json['statecode'];
    address1_stateorprovince = json['address1_stateorprovince'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['entityimage_url'] = this.imageUrl;
    data['description'] = this.description;
    data['accountnumber'] = this.accountnumber;
    data['statecode'] = this.statecode;
    data['address1_stateorprovince'] = this.address1_stateorprovince;
    return data;
  }
}