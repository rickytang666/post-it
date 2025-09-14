import { AgentLanguageInterface } from '../Agents/AgentLanguageInterface';
import { CHARACTER_LIMITS, TextLimiter } from '../Utils/TextLimiter';
import { Message } from '../Agents/AgentTypes';

/**
 * Summary Tool - focuses on location comments and user opinions
 * Specializes in summarizing and answering questions about user comments for specific places
 * Cleans up and structures user-generated content for better readability
 */
export class SummaryTool {
  public readonly name = 'summary_tool';
  public readonly description = 'Summarizes user comments and opinions about specific locations, providing clean, structured information';

  public readonly parameters = {
    type: 'object',
    properties: {
      query: { type: 'string', description: 'The user query about location comments or place information' },
      context: { type: 'array', description: 'Array of previous conversation messages for context' },
      summaryContext: { type: 'object', description: 'Location comments and user opinions to analyze and summarize' },
      maxLength: { type: 'number', description: 'Maximum character length for the response', default: CHARACTER_LIMITS.BOT_CARD_TEXT },
      educationalFocus: { type: 'boolean', description: 'Whether to maintain educational focus', default: true },
      locationNotes: { type: 'string', description: 'Additional location notes/comments to include in analysis' }
    },
    required: ['query']
  };

  private languageInterface: AgentLanguageInterface;

  constructor(languageInterface: AgentLanguageInterface) {
    this.languageInterface = languageInterface;
    print("SummaryTool: 📍 Location comment summarizer initialized");
  }

  public async execute(args: Record<string, unknown>): Promise<{ success: boolean; result?: any; error?: string }> {
    const { query, context, summaryContext, maxLength = CHARACTER_LIMITS.BOT_CARD_TEXT, educationalFocus = true, locationNotes } = args;

    if (!query || typeof query !== 'string') {
      return { success: false, error: 'Query parameter is required and must be a string' };
    }

    try {
      print(`SummaryTool: 📍 Processing location comment query: "${(query as string).substring(0, 50)}..."`);
      
      // Build enhanced system prompt with location comment context injection
      const systemPrompt = this.buildLocationCommentSystemPrompt(summaryContext, educationalFocus as boolean, locationNotes as string);
      
      // Prepare conversation context
      const conversationHistory = this.prepareConversationHistory(context, query as string);
      
      // Generate AI response with summary-injected prompt
      const aiResponse = await this.generateSummaryResponse(
        systemPrompt,
        conversationHistory,
        maxLength as number
      );
      
      // Build final response
      const response = {
        message: aiResponse,
        relatedTopics: this.extractLocationTopics(summaryContext),
        suggestedFollowUp: this.generateLocationCommentFollowUps(query as string, summaryContext),
        educationalLevel: 'general',
        processingTime: Date.now(),
        toolUsed: 'summary_tool',
        locationFocused: true
      };
      
      print(`SummaryTool: ✅ Generated location comment response`);
      
      return {
        success: true,
        result: response
      };
      
    } catch (error) {
      print(`SummaryTool: ❌ ERROR - Summary processing failed: ${error}`);
      return { 
        success: false, 
        error: `Summary tool failed: ${error}` 
      };
    }
  }

  /**
   * Build system prompt with location comment context injection
   */
  private buildLocationCommentSystemPrompt(summaryContext: any, educationalFocus: boolean, locationNotes?: string): string {
    let prompt = "You are answering specific questions about location comments and user opinions:\n\n";
    
    // Inject location comment content into system prompt
    if (summaryContext && summaryContext.summaries && Array.isArray(summaryContext.summaries)) {
      prompt += "LOCATION COMMENTS:\n";
      summaryContext.summaries.forEach((summary: any, index: number) => {
        if (summary.title && summary.content) {
          prompt += `\nComment ${index + 1}: ${summary.title}\n`;
          prompt += `${summary.content}\n`;
        }
      });
      prompt += "\n";
    } else if (summaryContext && summaryContext.title && summaryContext.content) {
      // Handle mock data structure from AgentOrchestrator
      prompt += "LOCATION COMMENTS:\n";
      prompt += `Place: ${summaryContext.title}\n`;
      prompt += `Comments: ${summaryContext.content}\n`;
      
      if (summaryContext.keyPoints && Array.isArray(summaryContext.keyPoints)) {
        prompt += "\nKey Points:\n";
        summaryContext.keyPoints.forEach((point: string, index: number) => {
          prompt += `${index + 1}. ${point}\n`;
        });
      }
      prompt += "\n";
    } else if (summaryContext && typeof summaryContext === 'string') {
      prompt += `LOCATION COMMENTS:\n${summaryContext}\n\n`;
    } else {
      prompt += "LOCATION COMMENTS: [No comment content available]\n\n";
    }
    
    // Add additional location notes if provided
    if (locationNotes && typeof locationNotes === 'string' && locationNotes.trim().length > 0) {
      prompt += `ADDITIONAL LOCATION NOTES:\n${locationNotes}\n\n`;
    }
    
    prompt += "CRITICAL INSTRUCTIONS:\n";
    prompt += "- MAXIMUM RESPONSE LENGTH: 100 characters (this is a hard limit for concise comments)\n";
    prompt += "- Be EXTREMELY concise - use short phrases, not full sentences\n";
    prompt += "- Answer with key facts only, no elaboration\n";
    prompt += "- If asked about multiple topics, focus on the most important one\n";
    prompt += "- Omit pleasantries, transitional phrases, and filler words\n";
    prompt += "- Use short phrases separated by commas for multiple items\n";
    prompt += "- Focus on essential, actionable information about the location\n";
    prompt += "- Be serious and direct if security concerns are mentioned\n";
    
    if (educationalFocus) {
      prompt += "- Focus on the most essential information for visitors\n";
    }
    
    prompt += "- Example good response: 'Great food, friendly staff, busy'\n";
    prompt += "- Example bad response: 'This restaurant has excellent food with very friendly staff and gets quite busy during evening hours'\n";
    
    return prompt;
  }

  /**
   * Prepare conversation history for context
   */
  private prepareConversationHistory(context: any, currentQuery: string): Message[] {
    const messages: Message[] = [];
    
    // Add recent context if available
    if (context && Array.isArray(context)) {
      const recentMessages = context.slice(-10); // Last 10 messages for context
      
      for (const message of recentMessages) {
        if (message.role && message.content) {
          messages.push({
            role: message.role as 'user' | 'assistant' | 'system',
            content: message.content
          });
        }
      }
    }
    
    // Add current query
    messages.push({
      role: 'user' as const,
      content: currentQuery
    });
    
    return messages;
  }

  /**
   * Generate AI response with summary context
   */
  private async generateSummaryResponse(systemPrompt: string, messages: Message[], maxLength: number): Promise<string> {
    if (!this.languageInterface) {
      throw new Error("Language interface not available");
    }

    // Format messages for the language interface (system message + conversation history)
    const formattedMessages: Message[] = [
      {
        role: 'system' as const,
        content: systemPrompt
      },
      ...messages
    ];

    // Create the request with system prompt injection
    // textOnly: false enables voice output for summary explanations
    print("SummaryTool: 🔊 Requesting response with voice output enabled (textOnly: false)");
    const response = await this.languageInterface.generateResponse(
      formattedMessages,
      {
        maxTokens: Math.floor(maxLength / 3), // Rough token estimate
        temperature: 0.7,
        textOnly: false // Enable audio output
      }
    );

    // Extract response content
    let responseContent = "";
    if (typeof response === 'string') {
      responseContent = response;
    } else if (response && typeof response === 'object' && 'content' in response) {
      responseContent = (response as any).content || "";
    } else {
      throw new Error("No valid response received from AI");
    }

    if (!responseContent) {
      throw new Error("No response generated from AI");
    }

    // Apply character limits
    return TextLimiter.limitText(responseContent, maxLength);
  }

  /**
   * Extract location-related topics from comment context
   */
  private extractLocationTopics(summaryContext: any): string[] {
    const topics: string[] = [];
    
    if (summaryContext && summaryContext.summaries && Array.isArray(summaryContext.summaries)) {
      summaryContext.summaries.forEach((summary: any) => {
        if (summary.title) {
          topics.push(summary.title);
        }
      });
    } else if (summaryContext && summaryContext.keyPoints && Array.isArray(summaryContext.keyPoints)) {
      // Handle mock data structure - extract from key points
      topics.push(...summaryContext.keyPoints.slice(0, 3));
    } else if (summaryContext && summaryContext.title) {
      // Use the title as a topic
      topics.push(summaryContext.title);
    }
    
    // Fallback topics if no comment content available
    if (topics.length === 0) {
      return ['location comments', 'user opinions', 'place information'];
    }
    
    return topics.slice(0, 3); // Limit to 3 topics
  }

  /**
   * Generate follow-up questions based on location comment content
   */
  private generateLocationCommentFollowUps(query: string, summaryContext: any): string[] {
    const followUps: string[] = [];
    
    // Generic location comment follow-ups
    followUps.push("Can you tell me more about this place?");
    followUps.push("What do other people say about this location?");
    followUps.push("Are there any safety concerns mentioned?");
    
    // Location-specific follow-ups if available
    if (summaryContext && summaryContext.summaries && Array.isArray(summaryContext.summaries)) {
      if (summaryContext.summaries.length > 1) {
        followUps.push("How do different comments compare?");
      }
      
      // Add follow-up about specific comments
      const firstComment = summaryContext.summaries[0];
      if (firstComment && firstComment.title) {
        followUps.push(`Tell me more about "${firstComment.title}"`);
      }
    } else if (summaryContext && summaryContext.keyPoints && Array.isArray(summaryContext.keyPoints)) {
      // Handle mock data structure - create follow-ups based on key points
      const firstPoint = summaryContext.keyPoints[0];
      if (firstPoint) {
        followUps.push(`Can you elaborate on "${firstPoint}"?`);
      }
      
      if (summaryContext.keyPoints.length > 1) {
        followUps.push("How do these different aspects compare?");
      }
    } else if (summaryContext && summaryContext.title) {
      // Use the title for follow-ups
      followUps.push(`Tell me more about "${summaryContext.title}"`);
    }
    
    return followUps.slice(0, 3); // Limit to 3 follow-ups
  }
} 