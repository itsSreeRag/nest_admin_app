String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Hotel List';
    case 2:
      return 'Permissions';
    case 3:
      return 'Reports';
    default:
      return 'Not found page';
  }
}