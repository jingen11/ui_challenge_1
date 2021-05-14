class Trend {
  final double lowest;
  final double highest;
  final double coversionRate;
  final List<GCoordinate> recentPrice;

  const Trend({
    this.lowest,
    this.highest,
    this.coversionRate,
    this.recentPrice,
  });
}

class GCoordinate {
  final double xPoint;
  final double yPoint;

  const GCoordinate(this.xPoint, this.yPoint);
}
