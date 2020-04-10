import 'package:flutter_mall/services/network.dart';

class ProductModel {
  String itemId;
  String itemTitle;
  String itemSubTitle;
  String packInfo;
  String afterSaleInfo;
  String defaultPicUrl;
  String sellerId;
  String newItem;
  String propIds;
  String brandId;
  String unit;
  int salesNum;
  int itemType;
  int itemSource;
  int volume;
  int isNew;
  int isSellingHot;
  int isImported;
  int isDistribution;
  double marketPrice;
  double minPrice;
  double wholesalePrice;
  double integralPrice;
  double maxReward;
  double weight;
  dynamic freight;

  ProductModel({
    this.itemId,
    this.itemTitle,
    this.itemSubTitle,
    this.salesNum,
    this.marketPrice,
    this.defaultPicUrl,
    this.isNew,
    this.isSellingHot,
    this.isImported,
    this.wholesalePrice,
    this.sellerId,
    this.newItem,
    this.propIds,
    this.brandId,
    this.minPrice,
    this.itemType,
    this.isDistribution,
    this.itemSource,
    this.freight,
    this.integralPrice,
    this.unit,
    this.weight,
    this.volume,
    this.packInfo,
    this.afterSaleInfo,
    this.maxReward,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        itemId: json["itemId"],
        itemTitle: json["itemTitle"],
        itemSubTitle: json["itemSubTitle"],
        salesNum: json["salesNum"],
        marketPrice: json["marketPrice"],
        defaultPicUrl: json["defaultPicUrl"],
        isNew: json["isNew"],
        isSellingHot: json["isSellingHot"],
        isImported: json["isImported"],
        wholesalePrice: json["wholesalePrice"],
        sellerId: json["sellerId"],
        newItem: json["newItem"],
        propIds: json["propIds"],
        brandId: json["brandId"],
        minPrice: json["minPrice"],
        itemType: json["itemType"],
        isDistribution: json["isDistribution"],
        itemSource: json["itemSource"],
        freight: json["freight"],
        integralPrice: json["integralPrice"],
        unit: json["unit"],
        weight: json["weight"],
        volume: json["volume"],
        packInfo: json["packInfo"],
        afterSaleInfo: json["afterSaleInfo"],
        maxReward: json["maxReward"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemTitle": itemTitle,
        "itemSubTitle": itemSubTitle,
        "salesNum": salesNum,
        "marketPrice": marketPrice,
        "defaultPicUrl": defaultPicUrl,
        "isNew": isNew,
        "isSellingHot": isSellingHot,
        "isImported": isImported,
        "wholesalePrice": wholesalePrice,
        "sellerId": sellerId,
        "newItem": newItem,
        "propIds": propIds,
        "brandId": brandId,
        "minPrice": minPrice,
        "itemType": itemType,
        "isDistribution": isDistribution,
        "itemSource": itemSource,
        "freight": freight,
        "integralPrice": integralPrice,
        "unit": unit,
        "weight": weight,
        "volume": volume,
        "packInfo": packInfo,
        "afterSaleInfo": afterSaleInfo,
        "maxReward": maxReward,
      };

  // 获取商品列表
  fetchProducts({
    // 请求参数
    Map<String, dynamic> parameters,
    // 成功回调
    Function success,
    // 失败回调
    Function fail,
  }) async {
    // 接口地址
    String api = '/v1/item';

    // 发起请求
    await SharedNetwork().get(
      api,
      query: parameters,
      success: (data) {
        // 模型数组
        List<ProductModel> products = [];
        // 返回数据
        List response = data['data']['itemList']['records'];
        // 遍历数组
        response.forEach((item) {
          ProductModel product = ProductModel.fromJson(item);
          if (null != product) {
            products.add(product);
          }
        });
        success(products);
      },
      fail: fail,
    );
  }
}
