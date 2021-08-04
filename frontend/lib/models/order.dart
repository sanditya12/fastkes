class OrderModel {
  String customerName;
  String customerNumber;
  String customerAddress;
  String hospitalCode;
  String customerLatLong;

  OrderModel({
    this.customerName = '',
    this.customerNumber = '',
    this.customerAddress = '',
    this.customerLatLong = '', // 'lat,long' no space after comma
    this.hospitalCode = '',
  });
}

class Address {}
