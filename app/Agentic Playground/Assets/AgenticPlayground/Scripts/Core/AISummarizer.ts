import { OpenAI } from "Remote Service Gateway.lspkg/HostedExternal/OpenAI";
import { OpenAITypes } from "Remote Service Gateway.lspkg/HostedExternal/OpenAITypes";
import Event from "SpectaclesInteractionKit.lspkg/Utils/Event";

// ================================
// Types for AI Summarizer
// ================================

interface SummarySection {
    title: string; // Max 157 chars per diagram spec
    content: string; // Max 785 chars per diagram spec
    keywords: string[];
    timestamp: number;
}

interface SummaryResult {
    success: boolean;
    sections: SummarySection[];
    originalLength: number;
    summaryLength: number;
    processingTime: number;
    error?: string;
}

/**
 * AISummarizer - AI-powered comment cleaning and structuring service
 * 
 * This service takes raw user comments about locations and converts them into 
 * clean, structured, and readable summaries that can be displayed in the UI.
 * 
 * Flow: User Comments → CommentStorage → CommentBridge → AISummarizer → CleanComments
 * 
 * This component takes messy user-generated content and converts it into 
 * well-formatted, concise summaries with proper character limits for display.
 */
@component
export class AISummarizer extends BaseScriptComponent {
    
    // ================================
    // Inspector Configuration
    // ================================
    
    @input
    @hint("Enable AI comment cleaning and summarization")
    public enableSummarization: boolean = true;
    
    @input
    @hint("OpenAI model to use for summarization")
    @widget(new ComboBoxWidget([
        new ComboBoxItem("gpt-4o-mini", "GPT-4o Mini"),
        new ComboBoxItem("gpt-4o", "GPT-4o"),
        new ComboBoxItem("gpt-3.5-turbo", "GPT-3.5 Turbo")
    ]))
    public model: string = "gpt-4o-mini";
    
    @input
    @hint("Maximum number of comment sections to generate")
    @widget(new SliderWidget(1, 10, 1))
    public maxSections: number = 5;
    
    @input
    @hint("Temperature for AI responses (0.0 = focused, 1.0 = creative)")
    @widget(new SliderWidget(0.0, 1.0, 0.1))
    public temperature: number = 0.3;
    
    @input
    @hint("Enable debug logging")
    public enableDebugLogging: boolean = true;
    
    // ================================
    // State Management
    // ================================
    
    private isProcessing: boolean = false;
    private currentRequestId: string = "";
    
    // ================================
    // Events
    // ================================
    
    public onSummaryGenerated: Event<SummaryResult> = new Event<SummaryResult>();
    public onSummaryError: Event<string> = new Event<string>();
    public onProcessingStarted: Event<string> = new Event<string>();
    public onProcessingCompleted: Event<void> = new Event<void>();
    
    // ================================
    // Lifecycle Methods
    // ================================
    
    onAwake() {
        if (this.enableDebugLogging) {
            print(`AISummarizer: 📍 AI Comment Cleaner initialized with model: ${this.model}`);
        }
    }
    
    // ================================
    // Public Interface
    // ================================
    
    /**
     * Generate clean, structured comment sections from raw user comments
     * This is the main method called by CommentBridge
     */
    public async generateSummary(text: string, title?: string): Promise<SummaryResult> {
        if (!this.enableSummarization) {
            return {
                success: false,
                sections: [],
                originalLength: text.length,
                summaryLength: 0,
                processingTime: 0,
                error: "Comment cleaning disabled"
            };
        }
        
        if (!text || text.trim().length === 0) {
            return {
                success: false,
                sections: [],
                originalLength: 0,
                summaryLength: 0,
                processingTime: 0,
                error: "Empty text provided"
            };
        }
        
        if (this.isProcessing) {
            return {
                success: false,
                sections: [],
                originalLength: text.length,
                summaryLength: 0,
                processingTime: 0,
                error: "Already processing a comment cleaning request"
            };
        }
        
        const startTime = Date.now();
        this.isProcessing = true;
        this.currentRequestId = `summary_${startTime}`;
        
        this.onProcessingStarted.invoke(this.currentRequestId);
        
        if (this.enableDebugLogging) {
            print(`AISummarizer: 🔄 Starting comment cleaning of ${text.length} characters`);
        }
        
        try {
            const result = await this.performSummarization(text, title);
            
            const processingTime = Date.now() - startTime;
            result.processingTime = processingTime;
            
            this.onSummaryGenerated.invoke(result);
            
            if (this.enableDebugLogging) {
                print(`AISummarizer: ✅ Comment cleaning completed in ${processingTime}ms, generated ${result.sections.length} sections`);
            }
            
            return result;
            
        } catch (error) {
            const processingTime = Date.now() - startTime;
            const errorResult: SummaryResult = {
                success: false,
                sections: [],
                originalLength: text.length,
                summaryLength: 0,
                processingTime: processingTime,
                error: `Comment cleaning failed: ${error}`
            };
            
            this.onSummaryError.invoke(errorResult.error);
            
            if (this.enableDebugLogging) {
                print(`AISummarizer: ❌ Comment cleaning error: ${error}`);
            }
            
            return errorResult;
            
        } finally {
            this.isProcessing = false;
            this.onProcessingCompleted.invoke();
        }
    }
    
    /**
     * Check if comment cleaner is currently processing
     */
    public isCurrentlyProcessing(): boolean {
        return this.isProcessing;
    }
    
    /**
     * Get current request ID
     */
    public getCurrentRequestId(): string {
        return this.currentRequestId;
    }
    
    // ================================
    // Private Methods
    // ================================
    
    private async performSummarization(text: string, title?: string): Promise<SummaryResult> {
        const summaryTitle = title || "Lecture Summary";
        
        // Create system prompt for summarization
        const systemPrompt = this.createSystemPrompt();
        
        // Create user prompt with the text to summarize
        const userPrompt = this.createUserPrompt(text, summaryTitle);
        
        // Call OpenAI
        const messages: OpenAITypes.ChatCompletions.Message[] = [
            {
                role: "system",
                content: systemPrompt
            },
            {
                role: "user", 
                content: userPrompt
            }
        ];
        
        const request: OpenAITypes.ChatCompletions.Request = {
            model: this.model.toLowerCase(), // Ensure model name is lowercase
            messages: messages,
            temperature: this.temperature,
            max_tokens: 2000, // Reasonable limit for summaries
            response_format: { type: "json_object" }
        };
        
        if (this.enableDebugLogging) {
            print(`AISummarizer: 📤 Sending request to OpenAI (${this.model})`);
        }
        
        const response = await OpenAI.chatCompletions(request);
        
        if (!response || !response.choices || response.choices.length === 0) {
            throw new Error("No response from OpenAI");
        }
        
        const responseContent = response.choices[0].message.content;
        
        if (this.enableDebugLogging) {
            print(`AISummarizer: 📥 Received response from OpenAI`);
            print(`AISummarizer: Response content: ${responseContent}`);
        }
        
        // Parse the JSON response
        return this.parseOpenAIResponse(responseContent, text.length);
    }
    
    private createSystemPrompt(): string {
        return `You are a location comment cleaner and organizer. Your task is to take messy user-generated comments about places and convert them into clean, structured, readable summaries for a location-based commenting system.

CRITICAL REQUIREMENTS:
1. Generate between 2 and ${this.maxSections} clean comment sections
2. Each section MUST have:
   - title: EXACTLY 40-50 characters (be concise! Brief location aspect)
   - content: EXACTLY 80-120 characters (be concise! Essential info only)
   - keywords: Array of 2-3 relevant location keywords
3. Focus on essential, practical information for visitors
4. Make comments extremely concise and accessible
5. Prioritize the most important information first
6. Clean up grammar, spelling, and unclear language
7. Be serious and direct when security concerns are mentioned

CHARACTER LIMIT OPTIMIZATION:
- For titles: Aim for 45-50 characters. Brief location aspect (food, atmosphere, safety, etc.)
- For content: Aim for 100-120 characters. Include:
  * Essential information about the location
  * Key details visitors need to know
  * Important notes or warnings
  * Safety information if mentioned
  * Clean, concise language
- If the original text is unclear, rewrite it for better readability
- Use short phrases and bullet points
- Remove all unnecessary words and filler

RESPONSE FORMAT:
You must respond with valid JSON in this exact format:
{
  "sections": [
    {
      "title": "Location Aspect (MUST be 40-50 chars)",
      "content": "Essential info (MUST be 80-120 chars)",
      "keywords": ["keyword1", "keyword2"]
    }
  ]
}

Remember: This is for helping people understand locations better. Use the full character allowance to provide comprehensive, valuable location information.`;
    }
    
    private createUserPrompt(text: string, title: string): string {
        return `Please clean up and organize the following user comments about a location:

LOCATION: ${title}

RAW USER COMMENTS TO CLEAN:
${text}

Create ${Math.min(this.maxSections, Math.ceil(text.length / 500))} clean, organized sections that capture the most important information about this location.

IMPORTANT: You MUST use the concise character limits:
- Each title MUST be 40-50 characters (brief location aspect)
- Each content section MUST be 80-120 characters (essential info only)

Make each section extremely concise and focused. Clean up and organize the content by:
- Fixing grammar, spelling, and unclear language
- Organizing information into logical categories (food, atmosphere, safety, etc.)
- Adding clarity to confusing or incomplete comments
- Being serious and direct about any security concerns mentioned
- Providing only essential information for visitors
- Using short, clear phrases

Each section should provide only the most essential information within the strict character limits.`;
    }
    
    private parseOpenAIResponse(responseContent: string, originalLength: number): SummaryResult {
        try {
            if (this.enableDebugLogging) {
                print(`AISummarizer: 🔍 Parsing response: ${responseContent.substring(0, 200)}...`);
            }
            
            const parsedResponse = JSON.parse(responseContent);
            
            if (!parsedResponse.sections || !Array.isArray(parsedResponse.sections)) {
                if (this.enableDebugLogging) {
                    print(`AISummarizer: ❌ Invalid response format. Parsed object: ${JSON.stringify(parsedResponse)}`);
                }
                throw new Error("Invalid response format: missing or invalid sections array");
            }
            
            const sections: SummarySection[] = [];
            let totalSummaryLength = 0;
            
            parsedResponse.sections.forEach((section: any, index: number) => {
                // Validate and enforce character limits
                const title = this.enforceCharacterLimit(section.title || `Section ${index + 1}`, 50);
                const content = this.enforceCharacterLimit(section.content || "", 120);
                const keywords = Array.isArray(section.keywords) ? section.keywords.slice(0, 5) : [];
                
                const summarySection: SummarySection = {
                    title: title,
                    content: content,
                    keywords: keywords,
                    timestamp: Date.now()
                };
                
                sections.push(summarySection);
                totalSummaryLength += title.length + content.length;
            });
            
            if (sections.length === 0) {
                throw new Error("No valid sections generated");
            }
            
            return {
                success: true,
                sections: sections,
                originalLength: originalLength,
                summaryLength: totalSummaryLength,
                processingTime: 0 // Will be set by caller
            };
            
        } catch (error) {
            if (this.enableDebugLogging) {
                print(`AISummarizer: ❌ Parse error: ${error}`);
                print(`AISummarizer: Raw response was: ${responseContent}`);
            }
            throw new Error(`Failed to parse OpenAI response: ${error}`);
        }
    }
    
    private enforceCharacterLimit(text: string, maxLength: number): string {
        if (!text) return "";
        
        if (text.length <= maxLength) {
            return text;
        }
        
        // Truncate at word boundary if possible
        const truncated = text.substring(0, maxLength);
        const lastSpace = truncated.lastIndexOf(' ');
        
        if (lastSpace > maxLength * 0.8) { // If we can keep at least 80% and cut at word boundary
            return truncated.substring(0, lastSpace) + '...';
        } else {
            return truncated.substring(0, maxLength - 3) + '...';
        }
    }
    
    // ================================
    // Utility Methods
    // ================================
    
    public getStatus(): { isProcessing: boolean; model: string; maxSections: number } {
        return {
            isProcessing: this.isProcessing,
            model: this.model,
            maxSections: this.maxSections
        };
    }
} 