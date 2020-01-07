class Transaction {
  final int id;
  final int amt;
  final DateTime from_date;
  final DateTime to_date;

  Transaction({
    this.id,
    this.amt,
    this.from_date,
    this.to_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amt': amt,
      'from_date': from_date,
      'to_date': to_date,
    };
  }

  @override
  String toString() {
    return 'Transaction{id: $id, amt: $amt, from_date: $from_date, to_date: $to_date}';
  }
}
