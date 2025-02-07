class TaskListMdoel {
  String? status;
  List<TaskData>? data;

  TaskListMdoel({this.status, this.data});

  TaskListMdoel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskData>[];
      json['data'].forEach((v) {
        data!.add(TaskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskData {
  String? sId;
  String? title;
  String? description;
  String? status;
  String? email;
  String? createdDate;

  TaskData(
      {this.sId,
      this.title,
      this.description,
      this.status,
      this.email,
      this.createdDate});

  TaskData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    email = json['email'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['email'] = this.email;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
