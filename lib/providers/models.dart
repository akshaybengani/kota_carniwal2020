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
  final String vid;
  final String name;
  final String email;
  final String mobile;
  final String address;
  final String password;

  Vendor(
    this.vid,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.password,
  );
}
