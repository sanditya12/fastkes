class OrderModel {
  String customerName;
  String customerNumber;
  String customerAddress;
  String hospitalCode;

  OrderModel({
    this.customerName = '',
    this.customerNumber = '',
    this.customerAddress = '', // harus dalam bentuk latlong
    this.hospitalCode = '',
  });
}

class Address {}
