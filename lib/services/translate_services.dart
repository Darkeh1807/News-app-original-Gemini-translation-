import 'package:google_generative_ai/google_generative_ai.dart';

const String key = "";
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
