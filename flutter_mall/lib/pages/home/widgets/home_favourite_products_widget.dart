import 'package:flutter/material.dart';
import 'package:flutter_mall/models/product_model.dart';

class HomeFavouriteProductsWidget extends StatelessWidget {
  // 商品列表
  final List<ProductModel> items;

  const HomeFavouriteProductsWidget({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double ratio = 0.66;

    return Container(
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
      ),
      child: Container(
        height: ((MediaQuery.of(context).size.width - 10.0) * 1.5 / ratio),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: ratio,
          ),
          itemCount: (items == null) ? 0 : items.length,
          itemBuilder: (context, index) {
            return _FavouriteProductWidget(
              item: items[index],
            );
          },
        ),
      ),
    );
  }
}

// 猜你喜欢商品视图
class _FavouriteProductWidget extends StatelessWidget {
  // 商品信息模型
  final ProductModel item;

  const _FavouriteProductWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Color(0xffeeeeee),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image(
                            image: NetworkImage(item.defaultPicUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    // 商品标题
                    Container(
                      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: Text(
                        // '梦洁出品1.5m1.8m床舒柔手感床上用品舒柔手感床上用品',
                        item.itemTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 28, 28, 28),
                        ),
                      ),
                    ),
                    // 商品价格
                    Container(
                      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(
                              '¥' + item.marketPrice.toString(),
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 247, 0, 47),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '门店价¥' + item.wholesalePrice.toString(),
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 173, 173, 173),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 商品店铺和销量
                    Container(
                      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 10.0,
                                  color: Color.fromARGB(255, 51, 51, 51),
                                ),
                                Text(
                                  '万达专营店',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromARGB(255, 135, 135, 135),
                                  ),
                                ),
                                Text(
                                  '1.2km',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromARGB(255, 97, 97, 97),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '月销' + item.salesNum.toString(),
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromARGB(255, 135, 135, 135),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // 国货标志
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'images/guo.png',
                      height: 22.0,
                      width: 22.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
