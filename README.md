# AI-Chat-Assistant
The AI Chat Assistant is an intelligent system designed to analyze and automatically summarize messages received via Telegram based on personalized user preferences.
Motivated by the high volume of daily information in office environments, this project aims to reduce cognitive load by filtering relevant content and improving communication efficiency. The solution utilizes a multi-agent architecture and a local Large Language Model (LLM) to interpret natural language, orchestrated entirely through n8n.

The system is built as a modular pipeline combining LLMs, visual orchestration, and persistent memory.

## Core Workflow
1) **Data Collection**: Raw messages are collected from Telegram via API.

2) **Context Retrieval**: User preferences are extracted from a PostgreSQL database to parameterize the analysis.

3) **Analysis (AI Agent)**: A local LLM (running via Ollama) interprets the message, classifying or summarizing it based on the retrieved context.

4) **Action**: The system generates a personalized summary or takes action (e.g., calendar updates).

## Technical Stack
**LLM Engine**: Ollama running Llama 3 (for reasoning) and Mistral (for long context) locally to ensure data sovereignty.

**Orchestration**: n8n manages the workflow logic, connecting Telegram, the LLM, and the database.

**Memory**: PostgreSQL stores user preferences, filtration parameters, and interaction history, acting as long-term memory.

**Infrastructure**: Docker is used to containerize all services, ensuring reproducibility and isolation.

## Features
**Message Summarization**: Identifies tasks and summaries from long threads.

**Smart Filtering**: Distinguishes between noise and critical information based on user-defined rules.

**Data Privacy**: All processing happens locally using open-source models; no data is sent to external cloud AI providers.

**Multi-Agent Behavior**: Implements a Planner -> Executor -> Critic flow (ReAct architecture) to handle complex reasoning.

## Prerequisites
To run this project, you need:

* Docker Desktop installed.
* A Telegram Bot Token (from @BotFather).
* System resources capable of running Llama 3 (Minimum 8GB RAM recommended for 7B/8B models).

## Installation & Setup

Clone the repository:
  <div style="position: relative; border-radius: 6px; overflow: hidden; border: 1px solid #e1e4e8;">
  <button style="position: absolute; top: 8px; right: 8px; padding: 3px 8px; font-size: 12px; font-weight: 500; color: #24292e; background-color: #f6f8fa; border: 1px solid #d1d5da; border-radius: 4px; cursor: pointer; z-index: 1;" onclick="navigator.clipboard.writeText(document.getElementById('code-snippet').textContent).then(() => { this.textContent = 'Copied!'; setTimeout(() => { this.textContent = 'Copy'; }, 2000); })">
  </button>
  <pre><code id="code-snippet">git clone https://github.com/your-username/ai-chat-assistant.git
cd ai-chat-assistant</code></pre>
</div>   
Configure Environment: Copy the example environment file and add your credentials (Telegram API Key, DB passwords).
<div style="position: relative; border-radius: 6px; overflow: hidden; border: 1px solid #e1e4e8;">
  <button style="position: absolute; top: 8px; right: 8px; padding: 3px 8px; font-size: 12px; font-weight: 500; color: #24292e; background-color: #f6f8fa; border: 1px solid #d1d5da; border-radius: 4px; cursor: pointer; z-index: 1;" onclick="navigator.clipboard.writeText(document.getElementById('code-snippet').textContent).then(() => { this.textContent = 'Copied!'; setTimeout(() => { this.textContent = 'Copy'; }, 2000); })">
  </button>
  <pre><code id="code-snippet">cp .env.example .env</code></pre>
</div>
Start the Services: Use Docker Compose to spin up n8n, PostgreSQL, and Ollama simultaneously.
<div style="position: relative; border-radius: 6px; overflow: hidden; border: 1px solid #e1e4e8;">
  <button style="position: absolute; top: 8px; right: 8px; padding: 3px 8px; font-size: 12px; font-weight: 500; color: #24292e; background-color: #f6f8fa; border: 1px solid #d1d5da; border-radius: 4px; cursor: pointer; z-index: 1;" onclick="navigator.clipboard.writeText(document.getElementById('code-snippet').textContent).then(() => { this.textContent = 'Copied!'; setTimeout(() => { this.textContent = 'Copy'; }, 2000); })">
  </button>
  <pre><code id="code-snippet">docker-compose up -d</code></pre>
</div>
Automatic Model Initialization: When you run docker-compose up -d, a temporary service named model-puller will automatically start, download the required LLM (defined in .env), and then stop. Note: The first run may take a few minutes depending on your internet speed as it downloads the model (approx 4GB).

Import Workflow:
* Open n8n in your browser (usually http://localhost:5678).
* Import the n8n/workflows/main_agent.json file.
* Activate the workflow.

## Theory & Concepts
This project leverages several State-of-the-Art (SOTA) concepts:
* **Transformer Architecture**: Uses self-attention to process global dependencies in message threads.
* **In-Context Learning**: The agent adapts to tasks via prompting without requiring fine-tuning.
* **Generative Agents**: Utilizes persistent memory (PostgreSQL) to simulate consistent behavior over time.
* **Subword Tokenization**: Handles typos and informal corporate slang effectively.

##  References & Bibliography

### Technical Documentation
1. **Meta AI**, ["Introducing Meta Llama 3: The most capable openly available LLM to date"](https://ai.meta.com/blog/meta-llama-3/), April 2024.
2. **Ollama Team**, ["Ollama Documentation - Architecture and Usage"](https://github.com/ollama/ollama), 2024.
3. **n8n**, ["AI Agents and Workflow Automation"](https://docs.n8n.io/), 2024.
4. **PostgreSQL Global Development Group**, ["About PostgreSQL & JSONB Support"](https://www.postgresql.org/about/), 2024.

### Academic Papers & Research
* **Vaswani et al. (2017)**. ["Attention Is All You Need"](https://arxiv.org/abs/1706.03762). *Advances in Neural Information Processing Systems (NIPS)*.
* **Brown et al. (2020)**. ["Language Models are Few-Shot Learners"](https://arxiv.org/abs/2005.14165). *NeurIPS*.
* **Touvron et al. (2023)**. ["LLaMA: Open and Efficient Foundation Models"](https://arxiv.org/abs/2302.13971). *arXiv preprint*.
* **Jiang et al. (2023)**. ["Mistral 7B"](https://arxiv.org/abs/2310.06825). *arXiv preprint*.
* **Yao et al. (2023)**. ["ReAct: Synergizing Reasoning and Acting in Language Models"](https://arxiv.org/abs/2210.03629). *ICLR*.
* **Park et al. (2023)**. ["Generative Agents: Interactive Simulacra of Human Behavior"](https://arxiv.org/abs/2304.03442). *UIST*.
