# Introduction to AI Engineering

AI engineering is the discipline of building applications on top of foundation models (such as large language models and multimodal models), focusing on adapting and deploying powerful pretrained AI systems for real-world tasks rather than developing them from scratch.

---

## What You’ll Learn

- The evolution and fundamentals of AI engineering
- Key concepts in building AI applications with foundation models
- Essential techniques: prompt engineering, context construction, and tools

---

## What's out of Scope (for now)

- Building and deploying MCP (Model Context Protocol)
- Core frameworks like smolagents, LangChain/LangGraph, and AutoGen
- RAG (Retrieval Augmented Generation), embeddings, and vector databases
- LLMOps: Evaluating, optimizing, and deploying AI systems
- Finetuning existing models

---

## What Are Foundation Models?

Foundation models are large, general-purpose AI models trained on massive, diverse datasets. Unlike traditional AI models designed for narrowly defined tasks, foundation models can be adapted for a wide variety of downstream applications through fine-tuning or prompt engineering. They form the backbone for generative AI tools in text, image, audio, and more.

---

## Example Foundation Models

| Model             | Provider  | Use Cases                                                                                                                                                | Context Size           | Price Per 1M Tokens            |
| ----------------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------------------------------ |
| GPT-4o            | OpenAI    | Multimodal content creation, customer support automation, general Q&A, coding assistance, brainstorming, document summarization                          | 128K tokens            | Input: $5.00 / Output: $15.00  |
| Gemini 2.5        | Google    | Large-scale processing, low-latency tasks, agentic use cases, multimodal analysis (text/image/video/audio), document analysis, codebase understanding    | 1M tokens (2M planned) | Input: $0.30 / Output: $2.50   |
| Claude Opus 4.1   | Anthropic | Complex coding tasks, long-running autonomous agents, technical documentation, multi-file refactoring, frontier agent products                           | 200K tokens            | Input: $15.00 / Output: $75.00 |
| Claude Sonnet 4.5 | Anthropic | Advanced coding, building complex agents, computer use automation, balanced performance for production systems, steerability for precise implementations | 200K tokens            | Input: $3.00 / Output: $15.00  |
| DeepSeek          | DeepSeek  | Cost-sensitive applications, reasoning tasks, mathematical problem solving, code generation, classification, summarization, extraction                   | 128K tokens            | Input: ~$0.56 / Output: ~$1.68 |
| Llama 4 Scout     | Meta      | Multi-document summarization, long-context analysis, codebase reasoning, personalization with extensive user data                                        | 10M tokens             | Input: ~$0.18 / Output: ~$0.59 |
| Llama 4 Maverick  | Meta      | Multilingual chat applications, customer support with image understanding, creative writing, general assistant tasks, multimodal interactions            | 2M tokens              | Input: ~$0.27 / Output: ~$0.85 |
| tiny-agent-a      | Dria      | Small but powerful modle designed for edge devices                                                                                                       | 1k tokens              | N/A                            |

---

## AI Workflow Overview

**How do AI applications actually work?**  
A simplified AI engineering workflow consists of the following steps:

1. **User Action**: A user provides input (prompt, data, or a request).
2. **AI Model**: The model interprets the input, generates results, or identifies the need for additional information or action.
3. **Tools/APIs**: For tasks needing real-world data, computation, or integration, the model requests information from tools, APIs, or databases.
4. **Response**: The final output (answer, prediction, or action) is composed, often combining both model-generated and tool-retrieved content, then returned to the user.

> **Diagram:**  
> User → LLM → Tools (optional) → LLM → User

---

## Model Output Limitations

**Important considerations for working with AI models:**

- **Hallucinations:** Models may generate plausible-sounding but false or unsupported information. Always validate outputs against trusted sources when accuracy is critical.
- **Bias:** Pretrained models can inherit or amplify the biases of their training data. Review and test for fairness issues, particularly in sensitive applications.
- **Prompt Sensitivity:** Small changes in prompt wording can lead to large differences in output; iterative experimentation and testing are essential.
- **Safeguards:** Use additional filters, validation steps, and human-in-the-loop checks to reduce errors and risks, especially for public-facing or high-stakes systems.

---

## Essential Techniques

- Prompt Engineering: Crafting effective input to steer model behavior
- Context Construction: Supplying relevant background or in-session data
- Developing Tools: Enabling models to interact with APIs, databases, and external systems

---

## Prompt Engineering

Prompt engineering is the art of crafting instructions that guide a model to generate the desired outcome.

**Key Best Practices:**

- Write clear and explicit instructions: Specify exactly what you want, including output format, tone, and constraints. Ambiguity leads to unpredictable results.

- Adopt a persona: Asking the model to take on a specific role (e.g., "act as a first-grade teacher") helps it use the right perspective for generating responses.​

- Provide examples: Including 2-5 examples of desired input-output pairs can significantly improve accuracy and consistency.​​

---

## Context Construction

Context management refers to supplying relevant background information, conversation history, and external data that enables the model to generate accurate, grounded responses.

**Be mindful of context limits**: Track token usage and prioritize the most relevant information

**What Goes into Context:**

- **Retrieved information (RAG)**: Real-time data from databases, documents, or APIs to supplement the model's knowledge
- **Available tools**: Definitions of functions the model can call​
- **Conversation history**: Previous messages in the current session for continuity
- **Roles**:
  - **System prompt**: Initial instructions defining the model's behavior and role
  - **User prompt**: The immediate task or question
  - **Assistant**: Previous messages provided by the LLM
  - **Tool**: Previous results of tool execution

---

## The Role of Tools

Tools are external data sources or services - such as APIs, databases, or custom processors - that can be accessed by AI models to augment or act beyond their built-in knowledge. Integrating tools lets models fetch live data, automate actions, and interact with systems securely and dynamically.

Today we'll talk about `Pythonic function calling`

**Why Tools Matter:**

- **Extend model capabilities:** Models have learned knowledge but can't access real-time data, execute code, or interact with external systems without tools.
- **Enable agentic workflows:** Tools allow models to perform multi-step tasks like retrieving information, processing it, and taking actions based on results.
- **Ground responses in reality:** Rather than relying solely on parametric knowledge (which can be outdated), tools provide access to current, verified information

**Best Practices:**

- **Write clear tool descriptions:** Document what each tool does, required parameters, and expected outputs so models understand when and how to use them
- **Distinguish read from write actions:** Separate read-only tools (data retrieval) from write tools (state modification). Write actions should require validation or human approval.

---

## Jupyter Notebook Primer

**Getting started with Jupyter Notebooks:**

- **Notebook Interface:**  
  Jupyter notebooks consist of cells. Each cell can contain either:

  - **Code:** Write and run Python (or other supported languages).
  - **Markdown:** Add formatted text, headers, lists, and equations using Markdown syntax.

- **Basic Actions:**

  - Run a cell: Shift + Enter
  - Add cell: (+) button or menu
  - Change cell type: Dropdown (Code/Markdown)
  - Restart: Kernel → Restart to reset the execution environment (clears variables/memory)
  - Save: Click the disk icon or File → Save

  Write clear comments and organize code logically—this makes notebooks readable and reusable for yourself and others.

---

## Glossary

| Term                                 | Definition                                                                                                     |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| AI Engineering                       | Building real-world applications using pretrained foundation models, focusing on adaptation and deployment.    |
| Foundation Model                     | Large, general-purpose AI model pretrained on massive data, adaptable for various downstream tasks.            |
| Large Language Model                 | Foundation model focused on human language understanding and generation using deep learning (e.g., GPT-4).     |
| Multimodal Model                     | Model trained to handle multiple data types (text, images, audio, etc.).                                       |
| Prompt Engineering                   | Designing input instructions to elicit useful outputs or behaviors from models.                                |
| Context Construction                 | Supplying extra context (documents, history, background) to improve model outputs.                             |
| Finetuning                           | Further training a model on specific data to specialize its behavior.                                          |
| Tool                                 | External system (API, database, search, etc.) accessible to models to supplement knowledge or perform actions. |
| Model Context Protocol (MCP)         | Protocol/server for securely connecting models/agents with tools and external data.                            |
| Agent                                | Software that coordinates model and tool calls to automate tasks and decision-making.                          |
| Retrieval-Augmented Generation (RAG) | Technique supplementing model responses with real-time data/document search.                                   |
| Token / Tokenization                 | Smallest unit for language models; converting text into these units for processing/generation.                 |
| Context Window                       | Amount of data (tokens) a model can consider at once.                                                          |
| Fine-tuned Model                     | Foundation model further trained for niche/specialized domain use.                                             |
| Inference                            | The act of executing a trained model to generate predictions or outputs.                                       |

## Additional Resources

- [AI Engineering by Chip Huyen](https://www.google.com/books/edition/AI_Engineering/abM1EQAAQBAJ)
- [LLM Visualization](https://bbycroft.net/llm) [source](https://github.com/bbycroft/llm-viz)
- [Math for Understanding LLMs](https://www.gilesthomas.com/2025/09/maths-for-llms)
- [Example LLM Project](https://threedle.github.io/ll3m/)
