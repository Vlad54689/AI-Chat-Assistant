# AI-Chat-Assistant
The AI Chat Assistant is an intelligent system designed to analyze and automatically summarize messages received via Telegram based on personalized user preferences.
Motivated by the high volume of daily information in office environments, this project aims to reduce cognitive load by filtering relevant content and improving communication efficiency. The solution utilizes a multi-agent architecture and a local Large Language Model (LLM) to interpret natural language, orchestrated entirely through n8n.

The system is built as a modular pipeline combining LLMs, visual orchestration, and persistent memory.
Core Workflow

Data Collection: Raw messages are collected from Telegram via API.


Context Retrieval: User preferences are extracted from a PostgreSQL database to parameterize the analysis.


Analysis (AI Agent): A local LLM (running via Ollama) interprets the message, classifying or summarizing it based on the retrieved context.


Action: The system generates a personalized summary or takes action (e.g., calendar updates).
