import "package:flutter/material.dart";

class Body {
  String name;
  DateTime date;
  String description;
  Color? color;

  Body(this.name, this.date, this.description,this.color);

  void setDate(nDate) {
    date = nDate;
  }

  void setDescription(nDes) {
    description = nDes;
  }

  void setName(nName) {
    name = nName;
  }
}
