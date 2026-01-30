class OpenAiChoice {
  final OpenAiMessage? message;

  OpenAiChoice({this.message});

  factory OpenAiChoice.fromJson(Map<String, dynamic> json) {
    return OpenAiChoice(
      message: json['message'] != null
          ? OpenAiMessage.fromJson(json['message'] as Map<String, dynamic>)
          : null,
    );
  }
}

class OpenAiResponse {
  final List<OpenAiChoice> choices;

  OpenAiResponse({required this.choices});

  factory OpenAiResponse.fromJson(Map<String, dynamic> json) {
    final rawChoices = json['choices'] as List<dynamic>? ?? [];
    final choices = rawChoices
        .map((e) => OpenAiChoice.fromJson(e as Map<String, dynamic>))
        .toList();
    return OpenAiResponse(choices: choices);
  }
}

// Local lightweight message class to avoid import cycles; mirrors OpenAiMessage structure
class OpenAiMessage {
  final String role;
  final String content;

  OpenAiMessage({required this.role, required this.content});

  factory OpenAiMessage.fromJson(Map<String, dynamic> json) {
    return OpenAiMessage(
      role: json['role'] as String? ?? 'user',
      content: json['content'] as String? ?? '',
    );
  }
}
