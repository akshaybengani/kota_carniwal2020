class Product {
  final String id;
  final String product_name;
  final String price;

  Product({
    this.id,
    this.product_name,
    this.price,
  });
}

class Student {
  final String stdid;
  final String name;
  final String email;
  final String mobile;
  final String instituteName;
  final String paymentType;
  final double amount;
  final String address;

  Student(
    this.stdid,
    this.name,
    this.email,
    this.mobile,
    this.instituteName,
    this.paymentType,
    this.amount,
    this.address,
  );
}

class Vendor {
  final String id;
  final String vendor_name;
  final String contact;
  final String email;

  Vendor({
    this.id,
    this.vendor_name,
    this.contact,
    this.email,
  });
}

class Transaction {
  final int transaction_amount;
  final String product_name;
  final int product_price;
  final int transactionStatus;

  Transaction({
    this.transaction_amount,
    this.product_name,
    this.product_price,
    this.transactionStatus,
  });
  
}
