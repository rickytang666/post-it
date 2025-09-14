import { AgentLanguageInterface } from '../Agents/AgentLanguageInterface';
import { CHARACTER_LIMITS, TextLimiter } from '../Utils/TextLimiter';

/**
 * General conversation tool for location-based commenting system
 * Handles questions about places, comments, and provides helpful location information
 * Specializes in comment clarification and general place-related Q&A
 */
export class GeneralConversationTool {
  public readonly name = 'general_conversation';
  public readonly description = 'Handles general questions about locations, comments, and place reviews using AI assistance';

  public readonly parameters = {
    type: 'object',
    properties: {
      query: { type: 'string', description: 'The user query to respond to' },
      maxLength: { type: 'number', description: 'Maximum character length for the response', default: CHARACTER_LIMITS.BOT_CARD_TEXT },
      conversational: { type: 'boolean', description: 'Whether to use conversational tone', default: true },
      educationalFocus: { type: 'boolean', description: 'Whether to maintain educational focus', default: true },
      locationNotes: { type: 'string', description: 'Location notes/comments to use as context for responses' }
    },
    required: ['query']
  };

  private languageInterface: AgentLanguageInterface;

  constructor(languageInterface: AgentLanguageInterface) {
    this.languageInterface = languageInterface;
    print("GeneralConversationTool: 🏢 Location comment assistant initialized");
  }

  public async execute(args: Record<string, unknown>): Promise<{ success: boolean; result?: any; error?: string }> {
    const { query } = args;

    if (!query || typeof query !== 'string') {
      return { success: false, error: 'Query parameter is required and must be a string' };
    }

    return await this.generateConversationalResponse(args);
  }

  /**
   * Generate helpful response for location and comment-related questions
   */
  private async generateConversationalResponse(args: Record<string, unknown>): Promise<{ success: boolean; result?: any; error?: string }> {
    const {
      query,
      maxLength = CHARACTER_LIMITS.BOT_CARD_TEXT,
      conversational = true,
      educationalFocus = true,
      locationNotes
    } = args;
    
    print(`GeneralConversationTool: 🏢 Generating location comment response for: "${(query as string).substring(0, 50)}..."`);
    
    // Ensure maxLength is valid
    const validMaxLength = (maxLength as number > 0) ? maxLength as number : CHARACTER_LIMITS.BOT_CARD_TEXT;

    try {
      // Create a helpful location-based system prompt with actual location notes
      let systemPrompt = `You are a helpful location-based comment assistant that helps users understand and interact with place reviews and comments.

RESPONSE REQUIREMENTS:
- Your responses MUST be limited to exactly ${validMaxLength} characters or fewer
- This is a HARD LIMIT that cannot be exceeded under any circumstances
- Be extremely concise and informational without unnecessary chatter
- Provide essential, actionable information about places
- If the question is very general, offer to help with specific location topics

COMMUNICATION STYLE:
- Be approachable and friendly for general inquiries
- Be concise and informational - focus on useful facts
- Switch to serious, direct tone when addressing security concerns
- Use clear, easy-to-understand language for the general public
- Help clarify confusing comments or provide context about places

SPECIALIZATIONS:
- Answering questions about specific locations and their comments
- Clarifying unclear or confusing user comments
- Providing helpful information about places based on community feedback
- Identifying potential security concerns in user comments`;

      // Add location notes context if provided
      if (locationNotes && typeof locationNotes === 'string' && locationNotes.trim().length > 0) {
        systemPrompt += `\n\nAVAILABLE LOCATION NOTES:\n${locationNotes}\n\nUse these actual location notes to answer questions about specific places. Reference the real notes when responding.`;
      } else {
        systemPrompt += `\n\nNote: No specific location notes provided. Answer based on general knowledge about places.`;
      }

      systemPrompt += `\n\nRemember: Be helpful, extremely concise, and safety-focused while staying within the ${validMaxLength} character limit.`;

      // Call the AI with the conversational system prompt 
      // textOnly: false enables voice output for conversational responses
      const response = await this.languageInterface.generateResponse([
        {
          role: 'system',
          content: systemPrompt
        },
        {
          role: 'user',
          content: query as string
        }
      ], {
        temperature: 0.8, // Slightly higher for more natural conversation
        maxTokens: Math.floor(validMaxLength / 2),
        textOnly: false // Enable audio output
      });
      
      print("GeneralConversationTool: 🔊 Voice response requested with textOnly: false");

      // Extract content from LLMResponse object
      let responseContent = response?.content || "";
      
      if (!responseContent || responseContent.length === 0) {
        throw new Error("No response received from AI");
      }
      
      // Apply character limit
      const limitedContent = TextLimiter.truncateAtWordBoundary(responseContent, validMaxLength);
      
      // Format response with proper structure
      const chatResponse = {
        message: limitedContent,
        relatedTopics: this.extractLocationTopicsFromResponse(limitedContent),
        suggestedFollowUp: this.generateLocationFollowUp(query as string),
        educationalLevel: 'general',
        processingTime: 0 // Will be set by calling agent
      };
      
      print(`GeneralConversationTool: ✅ Generated location comment response`);
      print(`GeneralConversationTool: 📝 Response length: ${chatResponse.message.length} chars`);
      
      return { success: true, result: chatResponse };
      
    } catch (error) {
      print(`GeneralConversationTool: ❌ ERROR - Conversational AI call failed: ${error}`);
      
      // Return a simple fallback (last resort)
      return { 
        success: true, 
        result: {
          message: "I'm here to help with location comments and place information! What would you like to know about?",
          relatedTopics: ["locations", "comments", "places"],
          suggestedFollowUp: ["Tell me about a specific place", "What comments are available?", "How can I help with location info?"],
          educationalLevel: 'general',
          processingTime: 0
        }
      };
    }
  }

  private extractLocationTopicsFromResponse(content: string): string[] {
    // Extract location-related topics from response
    const locationKeywords = content.toLowerCase().match(/\b(place|location|restaurant|shop|store|park|cafe|bar|hotel|spot|area|neighborhood|comment|review|rating|safety|security)\b/g);
    
    if (!locationKeywords) {
      return ["location", "comments", "places"];
    }
    
    const uniqueKeywords = [...new Set(locationKeywords)];
    return uniqueKeywords.slice(0, 3);
  }

  private generateLocationFollowUp(query: string): string[] {
    const lowerQuery = query.toLowerCase();
    
    if (lowerQuery.includes("hello") || lowerQuery.includes("hi") || lowerQuery.includes("hey")) {
      return [
        "What place would you like to know about?",
        "Are you looking for comments about a specific location?",
        "How can I help you with location information?"
      ];
    }
    
    if (lowerQuery.includes("restaurant") || lowerQuery.includes("cafe") || lowerQuery.includes("food")) {
      return [
        "Would you like to see comments about nearby restaurants?",
        "Are you looking for food recommendations?",
        "Do you want to know about specific dining spots?"
      ];
    }
    
    if (lowerQuery.includes("safe") || lowerQuery.includes("security") || lowerQuery.includes("danger")) {
      return [
        "Would you like more details about safety in this area?",
        "Are there specific security concerns you're worried about?",
        "Should I flag this for further review?"
      ];
    }
    
    if (lowerQuery.includes("comment") || lowerQuery.includes("review") || lowerQuery.includes("opinion")) {
      return [
        "Would you like me to clarify any specific comments?",
        "Are you looking for more details about this place?",
        "Do you want to see other reviews for comparison?"
      ];
    }
    
    return [
      "What else would you like to know about this place?",
      "Are there other locations you're interested in?",
      "Would you like me to clarify any comments?"
    ];
  }
} 