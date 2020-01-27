class Product {
  String id;
  String product_name;
  String price;

  Product({
    this.id,
    this.product_name,
    this.price,
  });
}

class Vendor {
  String id;
  String vendor_name;
  String contact;
  String email;

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
  final int transactionDate;

  Transaction({
    this.transaction_amount,
    this.product_name,
    this.transactionDate,
    this.product_price,
    this.transactionStatus,
  });
}

class LocalData {
  String pid;
  String pname;
  String pprice;
  String vid;
  String vname;
  String vemail;
  String vcontact;

  LocalData({
    this.pid,
    this.pname,
    this.pprice,
    this.vid,
    this.vname,
    this.vemail,
    this.vcontact,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['pid'] = pid;
    map['pname'] = pname;
    map['pprice'] = pprice;
    map['vid'] = vid;
    map['vname'] = vname;
    map['vemail'] = vemail;
    map['vcontact'] = vcontact;
    return map;
  }

  LocalData.fromMapObject(Map<String, dynamic> map) {
    this.pid = map['pid'];
    this.pname = map['pname'];
    this.pprice = map['pprice'];
    this.vid = map['vid'];
    this.vname = map['vname'];
    this.vemail = map['vemail'];
    this.vcontact = map['vcontact'];
  }
}
