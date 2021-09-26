class TransactionModel {
  final String vehicleId;
  final String transactionId;
  final String buyerName;
  final String buyerPhone;
  final String buyerEmail;
  final String sellerName;
  final String buyerId;
  final String priceSold;
  final String dateSold;
  final String profit;

  TransactionModel(
      {this.vehicleId,
      this.transactionId,
      this.buyerName,
      this.buyerPhone,
      this.buyerEmail,
      this.sellerName,
      this.buyerId,
      this.priceSold,
      this.dateSold,
      this.profit});
}
