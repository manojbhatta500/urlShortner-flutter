class FailedResponse {
  String? error;

  FailedResponse({this.error});

  FailedResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}
