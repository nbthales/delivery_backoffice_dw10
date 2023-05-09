enum Menu {
  paymentType(
    '/payment-type',
    'payment_type_icon.png',
    'payment_type_icon_selected.png',
    'Administrar Formas de Pagamento',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(this.route, this.assetIcon, this.assetIconSelected, this.label);
}
