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
        print(result.rawContent); // Trigger navigation to CartScreen with barcode
      }
    } catch (e) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    bool existItem = true;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            margin: const EdgeInsets.only(bottom: 20),
            child: LinearProgressIndicator(
              minHeight: 5,
              borderRadius: BorderRadius.circular(50),
              value: 1,
              valueColor: const AlwaysStoppedAnimation(DColors.black),
              backgroundColor: DBackground.blue,
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * (existItem ? 0.4 : 0.0),
            child: ListView(children: [
              CartItem(
                  title: 'Malboro',
                  amount: 12000,
                  quantity: 1,
                  onUpdate: _calculateTotal),
              Divider(),
              CartItem(
                  title: 'Surya',
                  amount: 12000,
                  quantity: 2,
                  onUpdate: _calculateTotal),
              Divider(),
              CartItem(
                  title: 'Sampoerna',
                  amount: 12000,
                  quantity: 1,
                  onUpdate: _calculateTotal),
              Divider(),
              CartItem(
                  title: 'Sampoerna',
                  amount: 12000,
                  quantity: 4,
                  onUpdate: _calculateTotal),
              Divider(),
              CartItem(
                  title: 'Sampoerna',
                  amount: 12000,
                  quantity: 5,
                  onUpdate: _calculateTotal),
            ]),
          ),
          CartBilingInformationItem(
            total: _total,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CartActionButton(
                title: 'Scan',
                icon: Icons.qr_code_scanner_rounded,
                onTap: () => _scanBarcode,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    return Container(
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
      child: Row(
        children: [
          const ActionIconButton(
            icon: Icons.abc_rounded,
            iconSize: 24,
            cardSize: 48,
            radius: 48,
            cardColor: DColors.blue,
          ),
          GroupedTitle(
            title: widget.title,
            subtitle: Money.idr.format(_subtotal),
          ),
          const Spacer(),
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
        Text(
          quantity.toString(),
          style: DTextStyle.setStyle(
              fontWeight: DFontWeight.reguler, size: DTextSizes.small),
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
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        height: 32,
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