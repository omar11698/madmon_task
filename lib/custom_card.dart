import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomCard extends StatefulWidget {
  final int number;
  final String status;
  final String location;
  final String sellerName;
  final String sellerPhone;
  final String buyerName;
  final String buyerPhone;
  final String unitPrice;
  final String unitCommission;
  final String dateReserved;
  final String lastAction;

  const CustomCard({
    super.key,
    required this.number,
    required this.status,
    required this.location,
    required this.sellerName,
    required this.sellerPhone,
    required this.buyerName,
    required this.buyerPhone,
    required this.unitPrice,
    required this.unitCommission,
    required this.dateReserved,
    required this.lastAction,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  // Expand or collapse the content
  void expandAnimate() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (isExpanded) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(CustomCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'PlusJakartaSans', color: Colors.black);
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 25),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xffDCDCFF), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 19, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number and Status Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${widget.number}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.location,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 125,
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: _statusColor(widget.status),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      widget.status,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            const Divider(
              color: Color(0xffE5EBF0),
            ),
            const SizedBox(height: 8),

            // Seller Info Section
            const Text(
              'Seller Info',
              style: textStyle,
            ),
            const SizedBox(height: 8),
            Text(
              widget.sellerName,
              style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/contact.svg',
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.sellerPhone,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            // Buyer Info Section
            SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xffE5EBF0)),
                  const SizedBox(height: 8),
                  const Text(
                    'Buyer Info',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'PlusJakartaSans', color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.buyerName,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/contact.svg',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.sellerPhone,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xffE5EBF0)),
                  // Unit Price and Commission Row
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Unit Price',
                        style: textStyle,
                      ),
                      Text(
                        'Unit Commission',
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.unitPrice,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      Text(
                        widget.unitCommission,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xffE5EBF0)),
                  const SizedBox(height: 8),

                  // Date Reserved and Last Action Row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date Reserved',
                        style: textStyle,
                      ),
                      Text(
                        'Last Action',
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.dateReserved,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        widget.lastAction,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xffE5EBF0)),
                  const SizedBox(height: 8),

                  // Notes Section
                  const Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'See Notes',
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(color: Color(0xffE5EBF0)),
            Center(
              child: Transform.rotate(
                  // make the arrow downward
                  angle: !isExpanded ? 3.14 * 1.5 : 3.14 * -1.5,
                  child: IconButton(
                      onPressed: () {
                        expandAnimate();
                        _runExpandCheck();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                      ))),
            )
          ],
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.green;
      case 'contract signed':
        return Colors.blue;
      case 'no answer':
        return Colors.orange;
      case 'commission':
        return Colors.purple;
      case 'meeting scheduled':
        return Colors.cyan;
      case 'follow up':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
