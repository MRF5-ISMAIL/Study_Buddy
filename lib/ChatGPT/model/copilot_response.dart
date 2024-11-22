class CopilotResponse {
  final String message;
  final String status;
  final String? conversationId;
  final List<dynamic> images;
  final List<dynamic> webSearches;
  final List<dynamic> sources;
  final bool? conversationEnded;
  final int? userMessagesLimit;
  final int? userMessagesRemaining;

  CopilotResponse({
    required this.message,
    required this.status,
    this.conversationId,
    required this.images,
    required this.webSearches,
    required this.sources,
    this.conversationEnded,
    this.userMessagesLimit,
    this.userMessagesRemaining,
  });

  factory CopilotResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return CopilotResponse(
      message: data['message'] ?? '',
      status: json['status'] ?? '',
      conversationId: data['conversation_id'],
      images: data['images'] ?? [],
      webSearches: data['web_searches'] ?? [],
      sources: data['sources'] ?? [],
      conversationEnded: data['conversation_ended'],
      userMessagesLimit: data['user_messages_limit'],
      userMessagesRemaining: data['user_messages_remaining'],
    );
  }
}
