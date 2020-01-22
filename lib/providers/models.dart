class Product {
  final String pid;
  final String name;
  final String category;
  final double price;

  Product(
    this.pid,
    this.name,
    this.category,
    this.price,
  );
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
