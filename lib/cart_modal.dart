class Cart{

  late final int? id;
  final String? productId;
  final String? productName;
  final String? initialPrice;
  final String? productPrice;
  final int? quantity;
  final String? unitTag;
  final String? image;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.initialPrice,
    required this.quantity,
    required this.unitTag,
    required this.image,

  });

  Cart.fromMap(Map<dynamic , dynamic>  res)
  : id = res['id'],
  productId = res["productId"],
  productName = res["productName"],
  initialPrice = res["initialPrice"],
  productPrice = res["productPrice"],
  quantity = res["quantity"],
  unitTag = res["unitTag"],
  image = res["image"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productId' : productId,
      'productName' :productName,
      'initialPrice' : initialPrice,
      'productPrice' : productPrice,
      'quantity' : quantity,
      'unitTag' : unitTag,
      'image' : image,
    };
  }
}