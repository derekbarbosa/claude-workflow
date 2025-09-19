# Claude AI - Agentic Workflow Framework

This repository contains a sophisticated framework for creating a powerful, local-first AI assistant. The system is designed around a "technical lead" AI named Claude, which orchestrates a team of specialized AI agents to perform complex software engineering tasks in a structured and systematic way.

The goal of this project is to provide a cloneable, out-of-the-box solution for anyone who wants to run a robust, agentic AI workflow on their own machine.

## Core Concepts

The workflow is governed by a core "constitution" defined in `src/CLAUDE.md`. This file establishes the AI's persona, its operational modes (`ANALYSIS`, `IMPLEMENTATION`, `REVIEW`), and a strict set of protocols for safety, tool use, and quality assurance.

The primary principle is **Delegation-First**. The main AI agent breaks down complex problems and delegates sub-tasks to a large team of specialized agents, each with a specific domain of expertise.

## Directory Structure

Here is a breakdown of the key directories and their purpose within the framework:

-   **`src/`**: The core directory containing all the operational files for the AI.
    -   **`CLAUDE.md`**: The main system prompt that defines the core agent's personality, rules, and protocols. This is the "brain" of the operation.
    -   **`agent-reserves/`**: Contains the system prompts for over 100 specialized "agents." Each file defines an expert in a specific domain (e.g., `python-expert.md`, `security-engineer.md`, `database-specialist.md`).
    -   **`commands/`**: Defines high-level, user-facing commands that orchestrate complex workflows by combining the core agent with its specialized team (e.g., `plan-tdd.md`, `security-review.md`).
    -   **`shared-prompts/`**: A collection of modular prompt fragments that are dynamically loaded into the AI's context based on the task at hand. This allows the AI to adapt its instructions and capabilities on the fly.
    -   **`docs/`**: Contains additional documentation on the design principles and architecture of the agent system.
    -   **`hooks/`**: Scripts and utilities for integrating the AI with Git hooks, enabling automated checks and validations before commits.

-   **`INSTALL.md`**: A comprehensive, step-by-step guide for installing the necessary dependencies and Model Context Protocol (MCP) servers required to run the full agentic workflow.

## Getting Started

To get started, follow the instructions in the **[INSTALL.md](INSTALL.md)** file to set up the required MCP servers and configure your environment.


### Credits

Many thanks to [snits](https://github.com/snits) for his
[claude-files](https://github.com/snits/claude-files) repository, which was the
main source of inspiration here.

Also thanks to [0xfurai](https://github.com/0xfurai) for some of the fantastic
language "expert" agents in his
[claude-code-subagents](https://github.com/0xfurai/claude-code-subagents)
repository.
