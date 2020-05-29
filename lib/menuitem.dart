class MenuItem{
  String icon;
  String caption;

  MenuItem(this.icon, this.caption);

  factory MenuItem.fromJson(Map<String, dynamic> json){
    return MenuItem(
      json['icon'],
      json['caption'] 
    );
  }
}

class MenuItems{
  List<MenuItem> items=[];

  MenuItems(this.items);

  factory MenuItems.fromJson(Map<String, dynamic> json) {
    return MenuItems(
      (json['menuitems'] as List).map((i) {
        return MenuItem.fromJson(i);
      }).toList()
    );
  }

}