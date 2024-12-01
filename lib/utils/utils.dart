String convertNumberToString(int quantity) {
  String result = '';
  if (quantity >= 10000) {
    result = '${((quantity / 1000) * 10).round() / 10}K';
  } else {
    result = quantity.toString();
  }

  return result;
}