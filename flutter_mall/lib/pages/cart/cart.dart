import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _isSelectAll = false;
  bool _manageButtonState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            '购物车',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  setState(() {
                    this._manageButtonState = !this._manageButtonState;
                  });
                },
                child: Text(
                  !_manageButtonState ? '管理' : '完成',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView(
                  children: _listViewWidgets(),
                  padding: EdgeInsets.only(bottom: 10),
                ),
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(width: 0.5, color: Colors.grey)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              this._isSelectAll = !this._isSelectAll;
                            });
                          },
                          icon: Icon(this._isSelectAll
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked),
                          label: Text('全选')),
                      Row(
                        children: _bottomWidgetList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }

  List<Widget> _bottomWidgetList() {
    List<Widget> tempList = List();
    tempList.clear();
    if (!_manageButtonState) {
      Widget column = Column(
        children: <Widget>[
          RichText(
              text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '合计:',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(text: '￥350.0', style: TextStyle(color: Colors.red)),
            ],
          )),
          Text(
            '优惠券减￥30',
            style: TextStyle(color: Colors.red),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
      );
      Widget sizeBox = SizedBox(
        width: 10,
      );
      Widget button = RaisedButton(
        onPressed: () {},
        child: Text(
          '结算',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
      tempList.add(column);
      tempList.add(sizeBox);
      tempList.add(button);
    } else {
      Widget collectButton = FlatButton(
        onPressed: null,
        child: Text('移入收藏夹'),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );
      tempList.add(collectButton);

      Widget sizeBox = SizedBox(
        width: 10,
      );
      tempList.add(sizeBox);

      Widget delButton = FlatButton(
        onPressed: null,
        child: Text(
          '删除(1)',
          style: TextStyle(color: Colors.red),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );
      tempList.add(delButton);
    }
    return tempList;
  }

  List _dataList = [];

  List<Widget> _listViewWidgets() {
    List<Widget> tempList = List();
    tempList.clear();
    for (int i = 0; i < this._dataList.length; i++) {
      Widget card = Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: _subCell(i),
        ),
      );
      tempList.add(card);
    }
    return this._dataList.length > 0 ? tempList : [Text('')];
  }

  List<Widget> _subCell(int index) {
    List<Widget> tempList = List();
    tempList.clear();
    Map storeMap = this._dataList[index];
    Widget storeWidget = Container(
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
                icon: Icon(Icons.radio_button_unchecked), onPressed: () {}),
            width: 30,
            margin: EdgeInsets.only(left: 5),
          ),
          FlatButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Text(storeMap['sellerName']),
                  Icon(Icons.chevron_right)
                ],
              )),
        ],
      ),
    );
    tempList.add(storeWidget);
    List subValueList = storeMap['cartItems'];
    for (int i = 0; i < subValueList.length; i++) {
      Map subValue = subValueList[i];
      Widget subWidget = Container(
        padding: EdgeInsets.only(right: 10, bottom: 10),
        child: GestureDetector(
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.radio_button_unchecked), onPressed: () {}),
              Image.network(
                subValue['picUrl'],
                height: 100,
                width: 100,
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(10),
                height: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      subValue['itemName'],
                      maxLines: 2,
                    ),
                    Text(subValue['skuName']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '￥${subValue['amount']}',
                          style: TextStyle(color: Colors.red),
                        ),
                        Container(
                          width: 80,
                          height: 28,
                          padding: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                    child: GestureDetector(
                                      child: Text(
                                        '-',
                                        style: TextStyle(fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          subValue["quantity"] =
                                              subValue["quantity"] == 1
                                                  ? 1
                                                  : subValue["quantity"] - 1;
                                        });
                                      },
                                    ),
                                  ),
                                  flex: 1),
                              VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                              Expanded(
                                  child: Container(
                                    child: Text(
                                      '${subValue["quantity"]}',
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  flex: 1),
                              VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                              Expanded(
                                  child: Container(
                                    child: GestureDetector(
                                      child: Icon(Icons.add, size: 14),
                                      onTap: () {
                                        setState(() {
                                          subValue["quantity"] =
                                              subValue["quantity"] + 1;
                                        });
                                      },
                                    ),
                                  ),
                                  flex: 1),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/product');
          },
        ),
      );
      tempList.add(subWidget);
    }
    return tempList;
  }
}
