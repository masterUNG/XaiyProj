import 'dart:convert';

class AmountCartModel {
  final int amountCart;
  AmountCartModel({
    this.amountCart,
  });

  AmountCartModel copyWith({
    int amountCart,
  }) {
    return AmountCartModel(
      amountCart: amountCart ?? this.amountCart,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amountCart': amountCart,
    };
  }

  factory AmountCartModel.fromMap(Map<String, dynamic> map) {
    return AmountCartModel(
      amountCart: map['amountCart'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AmountCartModel.fromJson(String source) => AmountCartModel.fromMap(json.decode(source));

  @override
  String toString() => 'AmountCartModel(amountCart: $amountCart)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AmountCartModel &&
      other.amountCart == amountCart;
  }

  @override
  int get hashCode => amountCart.hashCode;
}
