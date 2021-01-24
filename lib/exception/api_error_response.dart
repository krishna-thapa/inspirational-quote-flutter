class ApiErrorResponse {
  final String userMsg;

  ApiErrorResponse({this.userMsg});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
        userMsg: json['userMsg']
    );
  }
}