# Claude Agentic Workflow Installation Guide

Welcome! This guide will walk you through setting up the powerful, agentic workflow enabled by this repository. The following steps involve installing a series of Model Context Protocol (MCP) servers, which are specialized tools that give the AI assistant advanced capabilities.

## Prerequisites

Before you begin, please ensure you have the following installed and configured:

1.  **Claude Code**: The core AI assistant must be installed and active in your environment.
2.  **Python Package Manager**: This project uses `uv`. Install it via pip:
    ```bash
    pip install uv
    ```
3.  **Node.js Package Manager**: You will need `npx`, which comes with `npm`. Ensure Node.js is installed.

## Adopting the repository

At the root of the repository, run the `adopt.sh` script like so:
``` bash
./adopt.sh $FIRSTNAME $SURNAME $USERNAME $EMAIL_DOMAIN
```

ex:

```bash
./adopt.sh Foo Bar user @foobar.com
```

This will ensure Claude will refer to you by the correct name, and sign off
commits accordingly.

## MCP Server Setup

Install the following MCP servers to unlock the full potential of your AI assistant.

### 1. Zen MCP Server

The Zen MCP Server is an AI orchestration platform that allows your primary AI assistant to collaborate with a multitude of other AI models (like Gemini, GPT, and Grok). This enables a multi-model approach to complex tasks, routing sub-tasks to the most suitable AI for the job.

**Installation:**
```bash
git clone https://github.com/BeehiveInnovations/zen-mcp-server.git
cd zen-mcp-server

# This script handles setup, config, and API key sourcing from your environment.
# It auto-configures for Claude Desktop, Claude Code, Gemini CLI, and Codex CLI.
./run-server.sh
```

### 2. Serena

Serena is an AI coding agent that gives the assistant a deep, semantic understanding of your codebase. It allows the AI to perform complex code analysis, retrieval, and editing tasks with greater accuracy than purely text-based methods.

**Installation:**
```bash
git clone https://github.com/oraios/serena
cd serena
uv run serena start-mcp-server
```
Then, add the following to your Claude configuration file (`.claude.json`):
```json
{
    "mcpServers": {
        "serena": {
            "command": "/path/to/your/uv",
            "args": ["run", "--directory", "/path/to/your/serena", "serena", "start-mcp-server"]
        }
    }
}
```
*(Note: Replace `/path/to/your/...` with the absolute paths on your system.)*

### 3. Private Journal MCP

Private Journal MCP provides a secure, local-only journaling tool for the AI assistant. This allows you to process and document thoughts, project notes, and insights with the guarantee that no data ever leaves your machine.

**Installation:**
```bash
npm install -g private-journal-mcp
claude mcp add-json private-journal '{"type":"stdio","command":"npx","args":["github:obra/private-journal-mcp"]}' -s user
```

### 4. Sequential Thinking Server

This server enables the AI to break down large, multifaceted problems into smaller, more manageable steps. It provides a structured, iterative thinking process that can be revised and refined, which is essential for complex planning and analysis.

**Installation:** Add to your `.claude.json`:
```json
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ]
    }
  }
}
```

### 5. Memory MCP Server

This server provides a persistent, long-term memory for the AI assistant, stored locally as a knowledge graph. It allows the AI to remember user preferences, past conversations, and specific details across multiple sessions for a more personalized and context-aware interaction.

**Installation:** Add to your `.claude.json`:
```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory"
      ]
    }
  }
}
```

### 6. Git MCP Server

This server acts as a bridge to your local Git repositories, allowing the AI assistant to programmatically perform version control operations. It can be used to automate tasks like checking status, committing changes, and viewing history.

**Installation:** Add to your `.claude.json`:
```json
{
  "mcpServers": {
    "git": {
      "command": "uvx",
      "args": ["mcp-server-git"]
    }
  }
}
```

### 7. Fetch MCP Server

This server empowers the AI assistant to retrieve and process content directly from web pages. It can convert HTML content into clean, AI-friendly Markdown, enabling real-time information gathering and analysis from the internet.

**Installation:** Add to your `.claude.json`:
```json
{
  "mcpServers": {
    "fetch": {
      "command": "uvx",
      "args": ["mcp-server-fetch"]
    }
  }
}
```

### 8. MCP Compass

MCP Compass is a discovery and recommendation service that helps the AI assistant find and utilize other MCP servers. It acts as a smart guide, enabling the AI to locate the most suitable tools for specific tasks through natural language queries.

**Installation:** Add to your `.claude.json`:
```json
{
  "mcpServers": {
    "mcp-compass": {
      "command": "npx",
      "args": [
        "-y",
        "@liuyoshio/mcp-compass"
      ]
    }
  }
}
```

### 9. MCP LSP Bridge

This server connects the AI to the Language Server Protocol (LSP), giving it access to advanced code intelligence features like code completion, definition lookups, and error checking for over 20 languages. It allows the AI to understand and analyze code with the same sophistication as your IDE.

**Installation:**
```bash
git clone https://github.com/rockerBOO/mcp-lsp-bridge.git
cd mcp-lsp-bridge
go build
```
Add to your `.claude.json`:
```json
{
  "mcpServers": {
    "lsp": {
      "type": "stdio",
      "command": "/path/to/your/mcp-lsp-bridge",
      "args": [],
      "env": {}
    }
  }
}
```
Finally, copy the example configuration file to your home directory:
```bash
mkdir -p ~/.config/mcp-lsp-bridge
cp lsp_config.example.json ~/.config/mcp-lsp-bridge/lsp_config.json
```

### 10. Context7

Context7 enhances AI accuracy by providing it with live, version-specific documentation and code examples from the internet. It combats the problem of AI models generating outdated or incorrect code by injecting the latest official documentation directly into the AI's prompt.

**Installation:**
1. Create a Context7 API key at [context7.com/dashboard](https://context7.com/dashboard).
2. Run the following command:
```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: YOUR_API_KEY"
```
*(Note: Replace `YOUR_API_KEY` with the key you generated.)*
