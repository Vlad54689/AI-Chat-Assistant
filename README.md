# AI-Chat-Assistant
The AI Chat Assistant is an intelligent system designed to analyze and automatically summarize messages received via Telegram based on personalized user preferences.
Motivated by the high volume of daily information in office environments, this project aims to reduce cognitive load by filtering relevant content and improving communication efficiency. The solution utilizes a multi-agent architecture and a local Large Language Model (LLM) to interpret natural language, orchestrated entirely through n8n.

The system is built as a modular pipeline combining LLMs, visual orchestration, and persistent memory.

# Core Workflow
1) **Data Collection**: Raw messages are collected from Telegram via API.

2) **Context Retrieval**: User preferences are extracted from a PostgreSQL database to parameterize the analysis.

3) **Analysis (AI Agent)**: A local LLM (running via Ollama) interprets the message, classifying or summarizing it based on the retrieved context.

4) **Action**: The system generates a personalized summary or takes action (e.g., calendar updates).

# Technical Stack
**LLM Engine**: Ollama running Llama 3 (for reasoning) and Mistral (for long context) locally to ensure data sovereignty.

**Orchestration**: n8n manages the workflow logic, connecting Telegram, the LLM, and the database.

**Memory**: PostgreSQL stores user preferences, filtration parameters, and interaction history, acting as long-term memory.

**Infrastructure**: Docker is used to containerize all services, ensuring reproducibility and isolation.

# Features
**Message Summarization**: Identifies tasks and summaries from long threads.

**Smart Filtering**: Distinguishes between noise and critical information based on user-defined rules.

**Data Privacy**: All processing happens locally using open-source models; no data is sent to external cloud AI providers.

**Multi-Agent Behavior**: Implements a Planner -> Executor -> Critic flow (ReAct architecture) to handle complex reasoning.
