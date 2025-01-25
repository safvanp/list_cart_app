import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SalesReportApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class SalesItem {
  final DateTime date;
  final String productName;
  final double price;
  final String paymentType;

  SalesItem({
    required this.date,
    required this.productName,
    required this.price,
    required this.paymentType,
  });
}

class SalesReportApp extends StatefulWidget {
  @override
  _SalesReportAppState createState() => _SalesReportAppState();
}

class _SalesReportAppState extends State<SalesReportApp> {
  final List<SalesItem> salesItems = [
    SalesItem(date: DateTime(2022, 07, 1), productName: 'Product A', price: 100.0, paymentType: 'Cash'),
    SalesItem(date: DateTime(2022, 07, 2), productName: 'Product B', price: 50.0, paymentType: 'Card'),
    SalesItem(date: DateTime(2022, 07, 3), productName: 'Product C', price: 150.0, paymentType: 'Credit Card'),
    SalesItem(date: DateTime(2022, 07, 4), productName: 'Product D', price: 175.0, paymentType: 'Debit Card'),
    SalesItem(date: DateTime(2022, 17, 5), productName: 'Product E', price: 200.0, paymentType: 'Cash'),
    SalesItem(date: DateTime(2022, 07, 6), productName: 'Product F', price: 300.0, paymentType: 'Cash'),
    SalesItem(date: DateTime(2022, 07, 6), productName: 'Product G', price: 1000.0, paymentType: 'Debit Card'),
    SalesItem(date: DateTime(2022, 07, 6), productName: 'Product H', price: 355.0, paymentType: 'Card'),
    SalesItem(date: DateTime(2022, 07, 7), productName: 'Product I', price: 117.0, paymentType: 'Credit Card'),
  ];

  String? selectedPaymentType = '';

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('All Payment Types'),
                leading: Radio<String>(
                  value: '',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Cash'),
                leading: Radio<String>(
                  value: 'Cash',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Card'),
                leading: Radio<String>(
                  value: 'Card',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Credit Card'),
                leading: Radio<String>(
                  value: 'Credit Card',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Debit Card'),
                leading: Radio<String>(
                  value: 'Debit Card',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // Add more payment types as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredSalesItems = selectedPaymentType == ''
        ? salesItems
        : salesItems.where((item) => item.paymentType == selectedPaymentType).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Report'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Product Name')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Payment Type')),
          ],
          rows: filteredSalesItems.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.date.toString())),
              DataCell(Text(item.productName)),
              DataCell(Text('\$${item.price.toStringAsFixed(2)}')),
              DataCell(Text(item.paymentType)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
