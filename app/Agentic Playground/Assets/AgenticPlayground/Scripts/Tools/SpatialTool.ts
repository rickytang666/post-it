import { AgentLanguageInterface } from '../Agents/AgentLanguageInterface';
import { CHARACTER_LIMITS, TextLimiter } from '../Utils/TextLimiter';
import { Message } from '../Agents/AgentTypes';
import { setTimeout, clearTimeout } from "SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils";

/**
 * Spatial Tool - uses camera and AI for location-based spatial awareness
 * Specializes in analyzing current location context and identifying potential security concerns
 * Capable of seeing the surrounding environment and providing location-specific insights
 */
export class SpatialTool {
  public readonly name = 'spatial_tool';
  public readonly description = 'Analyzes current location context using camera input and provides location-specific insights and security assessments';

  public readonly parameters = {
    type: 'object',
    properties: {
      query: { type: 'string', description: 'The user query about the current location or environment' },
      context: { type: 'array', description: 'Array of previous conversation messages for context' },
      maxLength: { type: 'number', description: 'Maximum character length for the response', default: CHARACTER_LIMITS.BOT_CARD_TEXT },
      enableImageInput: { type: 'boolean', description: 'Whether to capture and analyze camera input', default: true },
      spatialContext: { type: 'string', description: 'Additional context about the current location and environment' },
      locationNotes: { type: 'string', description: 'Location notes/comments to use as context for spatial analysis' }
    },
    required: ['query']
  };

  private languageInterface: AgentLanguageInterface;
  private isCapturingImage: boolean = false;

  constructor(languageInterface: AgentLanguageInterface) {
    this.languageInterface = languageInterface;
    print("SpatialTool: 📍 Location awareness tool initialized with camera/AI support");
  }

  public async execute(args: Record<string, unknown>): Promise<{ success: boolean; result?: any; error?: string }> {
    const { query, context, maxLength = CHARACTER_LIMITS.BOT_CARD_TEXT, enableImageInput = true, spatialContext, locationNotes } = args;

    if (!query || typeof query !== 'string') {
      return { success: false, error: 'Query parameter is required and must be a string' };
    }

    try {
      print(`SpatialTool: 📍 Processing location query: "${(query as string).substring(0, 50)}..."`);
      
      // Build location awareness system prompt
      const systemPrompt = this.buildLocationSystemPrompt(spatialContext as string, enableImageInput as boolean, locationNotes as string);
      
      // Prepare conversation context
      const conversationHistory = this.prepareConversationHistory(context, query as string);
      
      // Capture and analyze current environment if enabled
      let imageContext = "";
      if (enableImageInput) {
        imageContext = await this.captureAndAnalyzeEnvironment();
      }
      
      // Generate AI response with spatial context
      const aiResponse = await this.generateSpatialResponse(
        systemPrompt,
        conversationHistory,
        imageContext,
        maxLength as number
      );
      
      // Build final response
      const response = {
        message: aiResponse,
        relatedTopics: this.extractLocationTopics(query as string),
        suggestedFollowUp: this.generateLocationFollowUps(query as string),
        educationalLevel: 'general',
        processingTime: Date.now(),
        toolUsed: 'spatial_tool',
        locationAware: true,
        usedCamera: enableImageInput as boolean
      };
      
      print(`SpatialTool: ✅ Generated location-aware response`);
      
      return {
        success: true,
        result: response
      };
      
    } catch (error) {
      print(`SpatialTool: ❌ ERROR - Spatial processing failed: ${error}`);
      return { 
        success: false, 
        error: `Spatial tool failed: ${error}` 
      };
    }
  }

  /**
   * Build system prompt for location awareness and security assessment
   */
  private buildLocationSystemPrompt(spatialContext: string, enableImageInput: boolean, locationNotes?: string): string {
    let prompt = "You are analyzing the current location environment and providing helpful information about places and potential security concerns.\n\n";
    
    prompt += "LOCATION CONTEXT:\n";
    if (spatialContext) {
      prompt += `Current location details: ${spatialContext}\n`;
    }
    
    if (enableImageInput) {
      prompt += "IMPORTANT: You have real-time camera input enabled and can see the current environment.\n";
      prompt += "You should analyze what you see and provide location-specific insights.\n";
      prompt += "Use your visual perception to assess the current location and identify any potential concerns.\n";
      prompt += "When asked 'what do you see', describe exactly what you can observe in your current field of view.\n";
    }
    
    // Add location notes if provided
    if (locationNotes && typeof locationNotes === 'string' && locationNotes.trim().length > 0) {
      prompt += `\nAVAILABLE LOCATION NOTES:\n${locationNotes}\n`;
    }
    
    prompt += "\nINSTRUCTIONS:\n";
    prompt += "- Answer questions based on the current location environment and visual context\n";
    prompt += "- Reference what you can see or understand about the current place\n";
    prompt += "- Provide helpful information about the location for visitors\n";
    prompt += "- If visual input is available, use it to provide specific, contextual responses\n";
    prompt += "- Focus on practical, actionable information about the current location\n";
    prompt += "- Be serious and direct when identifying potential security concerns\n";
    prompt += "- Connect visual observations to location-specific insights when relevant\n";
    prompt += "- Maintain awareness of safety and security in the current environment\n";
    
    return prompt;
  }

  /**
   * Capture and analyze the current environment using camera
   * This captures an actual camera frame and prepares it for visual analysis
   */
  private async captureAndAnalyzeEnvironment(): Promise<string> {
    if (this.isCapturingImage) {
      print("SpatialTool: ⏳ Already capturing image, using cached context");
      return "Visual analysis in progress from previous request";
    }

    this.isCapturingImage = true;

    try {
      print("SpatialTool: 📸 Capturing actual camera frame for visual analysis");
      
      // Import camera and video controller classes with compression settings
      const { VideoController } = require('Remote Service Gateway.lspkg/Helpers/VideoController');
      
      // Create a temporary video controller for frame capture
      // Using numeric values as these enums should be available in the global scope
      const videoController = new VideoController(
        1500, // frame interval
        1, // CompressionQuality.HighQuality
        0  // EncodingType.Jpg
      );
      
      let capturedFrame: string | null = null;
      
      // Set up frame capture listener
      const framePromise = new Promise<string>((resolve, reject) => {
        const timeout = setTimeout(() => {
          reject(new Error("Camera frame capture timeout"));
        }, 3000);
        
        videoController.onEncodedFrame.add((encodedFrame: string) => {
          clearTimeout(timeout);
          capturedFrame = encodedFrame;
          resolve(encodedFrame);
        });
      });
      
      // Start recording to capture a frame
      videoController.startRecording();
      print("SpatialTool: 🎥 Started camera recording for frame capture");
      
      // Wait for frame capture
      await framePromise;
      
      // Stop recording
      videoController.stopRecording();
      print("SpatialTool: 🛑 Stopped camera recording");
      
      if (capturedFrame) {
        print("SpatialTool: ✅ Successfully captured camera frame for visual analysis");
        return capturedFrame; // Return the base64 encoded image
      } else {
        throw new Error("No frame captured");
      }
      
    } catch (error) {
      print(`SpatialTool: ⚠️ Camera capture failed: ${error}`);
      return "Unable to capture camera frame - proceeding with text-based analysis";
    } finally {
      this.isCapturingImage = false;
    }
  }

  /**
   * Prepare conversation history for context
   */
  private prepareConversationHistory(context: any, currentQuery: string): Message[] {
    const messages: Message[] = [];
    
    // Add recent context if available
    if (context && Array.isArray(context)) {
      const recentMessages = context.slice(-8); // Last 8 messages for spatial context
      
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
   * Generate AI response with spatial context using AgentLanguageInterface Live API
   * This uses the Live API for spatial analysis with audio output support
   */
  private async generateSpatialResponse(systemPrompt: string, messages: Message[], imageContext: string, maxLength: number): Promise<string> {
    try {
      print("SpatialTool: 🔄 Using AgentLanguageInterface Live API for spatial analysis with audio output");
      
      // Build system message with spatial context and camera information
      const userMessage = messages[messages.length - 1];
      const spatialSystemMessage: Message = {
        role: 'system',
        content: `${systemPrompt}\n\nIMPORTANT: You have access to real-time camera input and should provide audio responses. Analyze what you can see in the current environment and respond with both text and audio. Be specific about what you can actually observe.`
      };
      
      // Build enhanced user message that includes camera context and actual image data
      let enhancedUserContent = userMessage.content;
      const enhancedUserMessage: Message = {
        role: 'user',
        content: enhancedUserContent
      };
      
      if (imageContext && imageContext.length > 100 && !imageContext.includes("Unable to capture")) {
        print("SpatialTool: 📷 Camera frame captured - sending visual input to AI");
        enhancedUserContent += "\n\n[Visual Analysis Required: I am currently looking at my environment. Please analyze the image I'm sending and describe what you can see.]";
        
        // Add the actual image data for multimodal AI processing
        // The imageContext contains base64 encoded image data
        enhancedUserMessage.content = enhancedUserContent;
        enhancedUserMessage.imageData = imageContext; // Include actual image for AI processing
        
      } else {
        print("SpatialTool: ⚠️ No camera frame available - using text-only mode");
        enhancedUserContent += "\n\n[Note: Camera input is not available. Please respond based on the context of the question.]";
        enhancedUserMessage.content = enhancedUserContent;
      }
      
      // Prepare messages for AI processing (Live API supports audio output)
      const aiMessages = [spatialSystemMessage, enhancedUserMessage];
      
      print(`SpatialTool: 📤 Sending spatial query to AgentLanguageInterface Live API`);
      
      // Use AgentLanguageInterface which supports both audio and video through Live API
      // textOnly: false enables voice output for spatial responses
      print("SpatialTool: 🔊 Requesting response with voice output enabled (textOnly: false)");
      const response = await this.languageInterface.generateResponse(aiMessages, {
        maxTokens: maxLength,
        temperature: 0.8,
        textOnly: false // Enable audio output
      });
      
      if (!response?.content) {
        throw new Error("No valid response received from AgentLanguageInterface");
      }
      
      print(`SpatialTool: ✅ Received spatial analysis with audio: "${response.content.substring(0, 100)}..."`);
      
      // Apply character limits
      return TextLimiter.limitText(response.content, maxLength);
      
    } catch (error) {
      print(`SpatialTool: ❌ AgentLanguageInterface Live API failed: ${error}`);
      
      // Fallback response for spatial queries
      return "I'm having trouble analyzing the visual environment right now. Please make sure camera access is enabled and try asking about what you see again.";
    }
  }

  /**
   * Extract location-related topics from query
   */
  private extractLocationTopics(query: string): string[] {
    const topics: string[] = [];
    const lowerQuery = query.toLowerCase();
    
    // Detect location/visual terms
    if (lowerQuery.includes('see') || lowerQuery.includes('look') || lowerQuery.includes('visual')) {
      topics.push('visual analysis');
    }
    
    if (lowerQuery.includes('environment') || lowerQuery.includes('place') || lowerQuery.includes('location')) {
      topics.push('location context');
    }
    
    if (lowerQuery.includes('safe') || lowerQuery.includes('security') || lowerQuery.includes('danger')) {
      topics.push('safety assessment');
    }
    
    if (lowerQuery.includes('current') || lowerQuery.includes('now') || lowerQuery.includes('here')) {
      topics.push('real-time location');
    }
    
    if (lowerQuery.includes('restaurant') || lowerQuery.includes('cafe') || lowerQuery.includes('shop')) {
      topics.push('place information');
    }
    
    // Default topics if none detected
    if (topics.length === 0) {
      topics.push('location awareness', 'current environment', 'place context');
    }
    
    return topics.slice(0, 3);
  }

  /**
   * Generate location-aware follow-up questions
   */
  private generateLocationFollowUps(query: string): string[] {
    const followUps: string[] = [];
    
    // General location follow-ups
    followUps.push("What else can you tell me about this location?");
    followUps.push("Are there any safety concerns I should know about?");
    followUps.push("Can you provide more details about this place?");
    
    // Query-specific follow-ups
    const lowerQuery = query.toLowerCase();
    if (lowerQuery.includes('see') || lowerQuery.includes('visual')) {
      followUps.push("Would you like me to analyze specific visual elements?");
    }
    
    if (lowerQuery.includes('safe') || lowerQuery.includes('security')) {
      followUps.push("Should I provide more safety information about this area?");
    }
    
    if (lowerQuery.includes('restaurant') || lowerQuery.includes('food')) {
      followUps.push("Would you like information about nearby dining options?");
    }
    
    if (lowerQuery.includes('understand') || lowerQuery.includes('explain')) {
      followUps.push("Should I provide more context about this location?");
    }
    
    return followUps.slice(0, 3);
  }
} 