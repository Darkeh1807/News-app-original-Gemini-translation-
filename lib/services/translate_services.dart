import 'package:google_generative_ai/google_generative_ai.dart';

const String key = "AIzaSyAmS1_HDiHURb4z4DtrxGrEsCjz6UkJ7E8";
final model = GenerativeModel(
  model: 'gemini-pro',
  apiKey: key,
  safetySettings: [
    SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none)
  ],
);

Future<GenerateContentResponse> translateContent(
    {required String text, required String language}) async {
  try {
    final prompt = 'Translate the following text to $language: $text';
    final content = [Content.text(prompt)];
    final resp = await model.generateContent(content);
    return resp;
  } catch (e) {
    rethrow;
  }
}
