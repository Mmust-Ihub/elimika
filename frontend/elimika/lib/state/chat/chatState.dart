// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatState {
  final bool isLoading;
  final String? response;
  final String? errorMessage;
  ChatState({
    this.isLoading=false,
    this.response,
    this.errorMessage,
  });

  ChatState copyWith({
    bool? isLoading,
    String? response,
    String? errorMessage,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoading': isLoading,
      'response': response,
      'errorMessage': errorMessage,
    };
  }

  factory ChatState.fromMap(Map<String, dynamic> map) {
    return ChatState(
      isLoading: map['isLoading'] as bool,
      response: map['response'] != null ? map['response'] as String : null,
      errorMessage: map['errorMessage'] != null ? map['errorMessage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatState.fromJson(String source) => ChatState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatState(isLoading: $isLoading, response: $response, errorMessage: $errorMessage)';

  @override
  bool operator ==(covariant ChatState other) {
    if (identical(this, other)) return true;
  
    return 
      other.isLoading == isLoading &&
      other.response == response &&
      other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => isLoading.hashCode ^ response.hashCode ^ errorMessage.hashCode;
}


class ReportState{
  final bool isLoading;
  final String? response;
  final String? errorMessage;
  ReportState({
    this.isLoading=false,
    this.response,
    this.errorMessage,
  });

  ReportState copyWith({
    bool? isLoading,
    String? response,
    String? errorMessage,
  }) {
    return ReportState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}