import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cashier_app_ui/component/buttons/icon_button.dart';
import 'package:cashier_app_ui/component/texts/group_title.dart';
import 'package:cashier_app_ui/config/preferences.dart';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:cashier_app_ui/helpers/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartSummary extends StatefulWidget {
  final String barcode;
  const CartSummary({super.key, this.barcode = ''});

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  int _total = 0;
  void _calculateTotal(int subtotal) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _total += subtotal;
      });
    });
  }

  Future _scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        addItem(CartData(
          title: 'Produk Ebud Jaya Sentosa',
          amount: 10000,
          quantity: 1,
        )); // Trigger navigation to CartScreen with barcode
      }
    } catch (e) {
      // Handle error if needed
    }
  }

  List<CartData> cartItemsFuture = [];
  @override
  void initState() {
    super.initState();
    fetchCartItems().then((items) {
      setState(() {
        cartItemsFuture = items;
      });
    });
  }

  void addItem(CartData newItem) {
    setState(() {
      cartItemsFuture.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool existItem = true;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: LinearProgressIndicator(
              minHeight: 3,
              borderRadius: BorderRadius.circular(50),
              value: 1,
              valueColor: const AlwaysStoppedAnimation(DColors.black),
              backgroundColor: DBackground.blue,
            ),
          ),

          cartItemsFuture.isEmpty
              ? const Center(child: LinearProgressIndicator())
              : SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (existItem ? 0.4 : 0.0),
                  child: ListView.separated(
                    itemCount: cartItemsFuture.length,
                    itemBuilder: (context, index) {
                      var item = cartItemsFuture[index];
                      return CartItem(
                        title: item.title,
                        amount: item.amount,
                        quantity: item.quantity,
                        onUpdate: _calculateTotal,
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
          CartBilingInformationItem(
            total: _total,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CartActionButton(
                title: 'Scan',
                icon: Icons.qr_code_scanner_rounded,
                onTap: _scanBarcode,
              ),
              CartActionButton(
                title: 'Check Out',
                icon: Icons.shopping_cart_checkout,
              ),
            ],
          ),

          // Tambahkan widget lain sesuai kebutuhan
        ],
      ),
    );
  }
}

class CartBilingInformationItem extends StatelessWidget {
  final int total;
  const CartBilingInformationItem({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final _total = Money.idr.format(total);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              'Total',
              style: DTextStyle.setStyle(
                  size: DTextSizes.small,
                  fontWeight: DFontWeight.medium,
                  color: DColors.black),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                _total,
                style: DTextStyle.setStyle(
                    size: DTextSizes.small,
                    fontWeight: DFontWeight.medium,
                    color: DColors.black),
                textAlign: TextAlign.right,
              ))
        ],
      ),
    );
  }
}

class CartActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const CartActionButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: DColors.blue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: DTextStyle.setStyle(
                  size: DTextSizes.normal,
                  fontWeight: DFontWeight.medium,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String title;
  final int amount;
  final int quantity;
  final ValueChanged<int> onUpdate;
  const CartItem({
    Key? key,
    required this.title,
    required this.amount,
    required this.quantity,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _quantity = 0;
  int _amount = 0;
  int _subtotal = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
    _amount = widget.amount;
    _subtotal = widget.amount * _quantity;
    widget.onUpdate(_subtotal);
  }

  void _addQuantity() {
    setState(() {
      _quantity++;
    });
    _calculateSubtotal();
  }

  void _subtractQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
      _calculateSubtotal();
    }
  }

  void _calculateSubtotal() {
    final int oldSubtotal = _subtotal;
    setState(() {
      _subtotal = _amount * _quantity;
    });
    widget.onUpdate(_subtotal - oldSubtotal);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: 60,
      width: MediaQuery.of(context).size.width * 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const ActionIconButton(
          //   icon: Icons.abc_rounded,
          //   iconSize: 24,
          //   cardSize: 48,
          //   radius: 48,
          //   cardColor: DColors.blue,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: DTextStyle.setStyle(
                        fontWeight: DFontWeight.medium, size: DTextSizes.small),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    Money.idr.format(_subtotal),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: DTextStyle.setStyle(
                        fontWeight: DFontWeight.light,
                        size: DTextSizes.extraSmall),
                  )),
            ],
          ),
          Center(
            child: Column(
              children: [
                CartItemActionButton(
                  onAdd: _addQuantity,
                  onSubtract: _subtractQuantity,
                  quantity: _quantity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  final VoidCallback? onAdd;
  final VoidCallback? onSubtract;
  final int quantity;

  const CartItemActionButton({
    Key? key,
    this.onAdd,
    this.onSubtract,
    this.quantity = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartButton(
          icon: Icons.remove,
          onTap: onSubtract,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.09,
          alignment: Alignment.center,
          child: Text(
            quantity.toString(),
            style: DTextStyle.setStyle(
                fontWeight: DFontWeight.reguler, size: DTextSizes.small),
          ),
        ),
        CartButton(
          icon: Icons.add,
          onTap: onAdd,
        ),
      ],
    );
  }
}

class CartButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CartButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 14),
        height: MediaQuery.of(context).size.width * 0.07,
        width: MediaQuery.of(context).size.width * 0.06,
        decoration: BoxDecoration(shape: BoxShape.circle, color: DColors.blue),
        child: Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

Future<List<CartData>> fetchCartItems() async {
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay API
    return [
      CartData(title: 'Radiant Armor PQ4543 Mitsubisi Toyota 5000 cc', amount: 12000, quantity: 1),
      CartData(title: 'Surya', amount: 12000, quantity: 2),
      CartData(title: 'Sampoerna Mild isi 16', amount: 12000, quantity: 1),
      CartData(title: 'Sampoerna', amount: 12000, quantity: 4),
      CartData(title: 'Sampoerna', amount: 12000, quantity: 5),
    ];
  }

class CartData {
  final String title;
  final int amount;
  final int quantity;

  CartData({required this.title, required this.amount, required this.quantity});
}
