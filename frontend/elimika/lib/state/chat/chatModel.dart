class ChatResponse {
  final String response;

  ChatResponse({required this.response});

  // Factory method to create an instance from JSON
  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(response: json['response']);
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {'response': response};
  }
}
