import { AgentLanguageInterface } from '../Agents/AgentLanguageInterface';
import { Message } from '../Agents/AgentTypes';
import { DiagramCreatorTool } from './DiagramCreatorTool';
import { GeneralConversationTool } from './GeneralConversationTool';
import { SummaryTool } from './SummaryTool';
import { SpatialTool } from './SpatialTool';
import { DiagramStorage } from '../Storage/DiagramStorage';
import { SummaryStorage } from '../Storage/SummaryStorage';
import { ChatStorage } from '../Storage/ChatStorage';

/**
 * Tool metadata for AI routing decisions
 */
interface ToolMetadata {
  name: string;
  description: string;
  capabilities: string[];
  useWhen: string[];
  instance: any;
}

/**
 * Intelligent AI-powered tool router that uses LLM reasoning for routing decisions
 * Replaces primitive string matching with contextual understanding
 */
export class ToolRouter {
  private languageInterface: AgentLanguageInterface;
  private toolIndex: Map<string, ToolMetadata> = new Map();
  private enableDebugLogging: boolean = true;
  private diagramCreatorTool: DiagramCreatorTool;

  constructor(languageInterface: AgentLanguageInterface, diagramStorage?: DiagramStorage) {
    this.languageInterface = languageInterface;
    
    // Initialize tools
    this.diagramCreatorTool = new DiagramCreatorTool(languageInterface, diagramStorage);
    const generalConversation = new GeneralConversationTool(languageInterface);
    const summaryTool = new SummaryTool(languageInterface);
    const spatialTool = new SpatialTool(languageInterface);
    
    // Index tools with their capabilities and use cases
    this.indexTool('diagram_tool', {
      name: 'diagram_tool',
      description: 'Creates visual diagrams from conversation content and learning points',
      capabilities: [
        'Create mind maps and concept diagrams',
        'Visualize educational content structure',
        'Generate interactive learning diagrams',
        'Organize information into visual hierarchies'
      ],
      useWhen: [
        'User explicitly requests a diagram, chart, or visualization',
        'User wants to "create", "draw", "visualize", or "map" concepts',
        'User asks to "show relationships" or "organize information visually"',
        'User requests mind maps, flowcharts, or concept maps'
      ],
      instance: this.diagramCreatorTool
    });

    this.indexTool('summary_tool', {
      name: 'summary_tool', 
      description: 'Summarizes user comments and opinions about specific locations, providing clean, structured information',
      capabilities: [
        'Summarize multiple user comments about a location',
        'Clean up and structure user-generated content for better readability',
        'Answer questions about specific location comments',
        'Provide organized information from user opinions about places'
      ],
      useWhen: [
        'User asks about comments or reviews for a specific place',
        'User wants to see summarized opinions about a location',
        'User asks about "what people say" about a place',
        'User wants cleaned-up, organized information from multiple comments',
        'User asks for summary of user opinions about a location'
      ],
      instance: summaryTool
    });

    this.indexTool('spatial_tool', {
      name: 'spatial_tool',
      description: 'Analyzes current location context using camera input and provides location-specific insights and security assessments',
      capabilities: [
        'Analyze current physical location with camera',
        'Provide real-time location context and safety assessment',
        'Answer questions about current location environment',
        'Identify potential security concerns in the current area'
      ],
      useWhen: [
        'User asks about current location or "what do you see right now"',
        'User wants real-time analysis of current place',
        'User asks about safety or security of current location',
        'User requests camera-based observation of immediate surroundings'
      ],
      instance: spatialTool
    });

    this.indexTool('general_conversation', {
      name: 'general_conversation',
      description: 'Handles general questions about locations, comments, and place reviews using AI assistance',
      capabilities: [
        'Answer general questions about places and locations',
        'Clarify unclear or confusing user comments',
        'Provide helpful information about places based on community feedback',
        'Handle location-related queries not requiring specialized tools'
      ],
      useWhen: [
        'General questions about places or locations not requiring specialized tools',
        'Questions about specific comments or reviews',
        'Location-related queries that don\'t need camera analysis or comment summarization',
        'Default choice when no other tool is specifically needed'
      ],
      instance: generalConversation
    });
    
    if (this.enableDebugLogging) {
      print(`ToolRouter: 🧠 AI-powered intelligent tool router initialized with ${this.toolIndex.size} indexed tools`);
      print("ToolRouter: 📚 Tools indexed: " + Array.from(this.toolIndex.keys()).join(', '));
    }
  }

  /**
   * Set the summary storage for tools that need it
   */
  public setSummaryStorage(summaryStorage: SummaryStorage): void {
    if (this.diagramCreatorTool) {
      this.diagramCreatorTool.setSummaryStorage(summaryStorage);
      print("ToolRouter: 🔗 Connected SummaryStorage to DiagramCreatorTool");
    }
  }

  /**
   * Set the chat storage for tools that need it
   */
  public setChatStorage(chatStorage: ChatStorage): void {
    if (this.diagramCreatorTool) {
      this.diagramCreatorTool.setChatStorage(chatStorage);
      print("ToolRouter: 🔗 Connected ChatStorage to DiagramCreatorTool");
    }
  }

  /**
   * Index a tool with its metadata for AI routing decisions
   */
  private indexTool(key: string, metadata: ToolMetadata): void {
    this.toolIndex.set(key, metadata);
    if (this.enableDebugLogging) {
      print(`ToolRouter: 📖 Indexed tool "${key}" with ${metadata.capabilities.length} capabilities`);
    }
  }

  /**
   * AI-powered intelligent routing - uses LLM to make routing decisions
   */
  public async routeQuery(args: Record<string, unknown>): Promise<{ success: boolean; result?: any; error?: string }> {
    const { query, summaryContext } = args;
    
    if (!query || typeof query !== 'string') {
      return { success: false, error: 'Query parameter is required and must be a string' };
    }

    try {
      // Get routing decision from AI
      const selectedTool = await this.getAIRoutingDecision(query as string, summaryContext);
      
      if (!selectedTool || !this.toolIndex.has(selectedTool)) {
        print(`ToolRouter: ⚠️ AI selected unknown tool "${selectedTool}", falling back to general_conversation`);
        const fallbackTool = this.toolIndex.get('general_conversation')!;
        return await fallbackTool.instance.execute(args);
      }

      const toolMetadata = this.toolIndex.get(selectedTool)!;
      
      if (this.enableDebugLogging) {
        print(`ToolRouter: 🧠 AI routing decision: "${selectedTool}" for query: "${(query as string).substring(0, 50)}..."`);
        print(`ToolRouter: 💡 Reasoning: ${toolMetadata.description}`);
      }

      return await toolMetadata.instance.execute(args);
      
    } catch (error) {
      print(`ToolRouter: ❌ AI routing failed: ${error}`);
      // Fallback to general conversation on error
      const fallbackTool = this.toolIndex.get('general_conversation')!;
      return await fallbackTool.instance.execute(args);
    }
  }

  /**
   * Use AI to make intelligent routing decision based on context and intent
   */
  private async getAIRoutingDecision(query: string, summaryContext?: any): Promise<string> {
    // Build tool index description for AI
    const toolDescriptions = Array.from(this.toolIndex.values()).map(tool => {
      return `**${tool.name}**:
- Description: ${tool.description}
- Use when: ${tool.useWhen.join('; ')}
- Capabilities: ${tool.capabilities.join('; ')}`;
    }).join('\n\n');

    // Build context information
    let contextInfo = '';
    if (summaryContext && summaryContext.title) {
      contextInfo = `\n\nAVAILABLE CONTEXT:
- Lecture Summary Available: "${summaryContext.title}"
- Summary Content: ${summaryContext.content ? 'Yes' : 'No'}
- Key Points Available: ${summaryContext.keyPoints ? summaryContext.keyPoints.length + ' points' : 'No'}`;
    }

    const routingPrompt = `You are an intelligent tool router for a location-based commenting AI assistant. Analyze the user query and select the most appropriate tool.

AVAILABLE TOOLS:
${toolDescriptions}${contextInfo}

USER QUERY: "${query}"

ROUTING RULES:
1. If user asks about comments, reviews, or opinions about a specific place, use "summary_tool"
2. If user requests diagrams, visualizations, or mind maps, use "diagram_tool"  
3. If user asks about current location, "what do you see", or safety concerns, use "spatial_tool"
4. For general location questions without specific tool needs, use "general_conversation"

Respond with ONLY the tool name (e.g., "summary_tool", "diagram_tool", "spatial_tool", "general_conversation").`;

    try {
      // Get routing decision from current language interface
      // Uses generateTextResponse() for silent routing (no voice output needed for internal decisions)
      const response = await this.languageInterface.generateTextResponse([{
        role: 'user',
        content: routingPrompt
      }]);
      
      if (!response || typeof response !== 'string') {
        throw new Error('Invalid routing response from AI');
      }

      // Extract tool name from response
      const toolName = response.trim().toLowerCase();
      
      // Validate tool name
      const validTools = Array.from(this.toolIndex.keys());
      const selectedTool = validTools.find(tool => toolName.includes(tool));
      
      if (!selectedTool) {
        print(`ToolRouter: ⚠️ AI response "${toolName}" didn't match any indexed tool, using general_conversation`);
        return 'general_conversation';
      }

      return selectedTool;
      
    } catch (error) {
      print(`ToolRouter: ❌ AI routing decision failed: ${error}`);
      return 'general_conversation';
    }
  }



  /**
   * Get tool information for registration with AgentToolExecutor
   */
  public getToolInfo() {
    return {
      name: 'intelligent_conversation',
      description: 'AI-powered intelligent router that analyzes location-related queries and selects the most appropriate specialized tool for comment analysis, location insights, or spatial awareness',
      parameters: {
        type: 'object',
        properties: {
          query: { type: 'string', description: 'User query to analyze and route to appropriate tool' },
          context: { type: 'array', description: 'Array of previous conversation messages for routing context' },
          summaryContext: { type: 'object', description: 'Location comments and user opinions - critical for routing decisions' },
          maxLength: { type: 'number', description: 'Maximum character length for the response' },
          educationalFocus: { type: 'boolean', description: 'Whether to focus on educational content' }
        },
        required: ['query']
      }
    };
  }

  /**
   * Get indexed tools information for debugging
   */
  public getIndexedTools(): string[] {
    return Array.from(this.toolIndex.keys());
  }

  /**
   * Get tool metadata for debugging
   */
  public getToolMetadata(toolName: string): ToolMetadata | undefined {
    return this.toolIndex.get(toolName);
  }
}
