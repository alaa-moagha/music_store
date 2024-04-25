class InvoiceModel {
  int? userId;
  String? creditCard;
  int? total;
  String? updatedAt;
  String? createdAt;
  int? id;

  InvoiceModel(
      {this.userId,
      this.creditCard,
      this.total,
      this.updatedAt,
      this.createdAt,
      this.id});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    creditCard = json['credit_card'];
    total = json['total'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['credit_card'] = this.creditCard;
    data['total'] = this.total;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
