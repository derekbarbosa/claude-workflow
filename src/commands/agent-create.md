Task agent-prompt-engineer with creating a new agent template in $CLAUDE_FILES_DIR/agent-templates/ using the standardized template ($CLAUDE_FILES_DIR/templates/agent-prompt.d). Once the template has been created, compile it with `$CLAUDE_FILES_DIR/tools/compile-agent-templates <template-name minus the .md extension>`

**Arguments: $ARGUMENTS**

- Agent name: "database-optimization-specialist"
- With domain: "database-optimization-specialist --domain=performance"

**Implementation steps:**

1. **Validate agent name:**
   - Extract agent name from $ARGUMENTS (first argument)
   - Ensure name follows kebab-case convention
   - Check if agent already exists in $CLAUDE_FILES_DIR/agent-templates/
   - Add .md extension if not present

2. **Gather agent details interactively:**
   - **Agent name**: Confirm/correct the kebab-case name
   - **Display name**: Human-readable title (e.g., "Database Optimization Specialist")
   - **Domain expertise**: Primary specialization area
   - **Key capabilities**: 3-4 main expertise areas  
   - **Color category**: Use the established color scheme:
     - 🎮 **red** - Game Development
     - 🏗️ **orange** - System Architecture
     - 🔬 **cyan** - Scientific/Mathematical
     - 💾 **blue** - Data/Database
     - ⚙️ **black** - Engineering/DevOps
     - 📋 **purple** - Process/Management
     - 🔧 **yellow** - Language/Tools
     - 📝 **green** - Other Specialists

3. **Generate agent content:**
   - Use $CLAUDE_FILES_DIR/templates/agent-prompt.md as base template
   - Replace template placeholders with collected information:
     - `[agent-name]` → kebab-case name
     - `[Agent Name]` → display name
     - `[role-based-color]` → selected color
     - `[agent role and expertise description]` → domain expertise
     - `[specific domain/capabilities]` → key capabilities
     - Fill in Core Expertise, Key Responsibilities, and other sections
   - **IMPORTANT**: Leave PROJECT-SPECIFIC-COMMANDS section with template placeholders
     - Keep `[project-specific-typecheck-command]` format in protected tags
     - Do NOT replace with actual commands (this happens during agent-deploy)

4. **Create agent file:**
   - Write to $CLAUDE_FILES_DIR/agent-templates/[agent-name].md
   - Ensure proper formatting with standardized sections:
     - Strategic Journal Policy (with Query First)
     - Persistent Output Requirement
     - Analysis Tools (including sequential-thinking guidance)

5. **Confirm creation:**
   - Display success message with file path
   - Show agent color and categorization
   - Suggest using `/agent-browse` to verify it appears in listings

**Example usage:**

```bash
/agent-create performance-optimization-specialist
/agent-create blockchain-architect --domain=cryptocurrency
```

**Template sections to customize:**

- Agent description and trigger conditions
- Core Expertise (3-4 key areas)
- Key Responsibilities
- Analysis Tools (domain-specific tools)
- Workflow Integration (how it fits with other agents)
- Decision Authority (what it can decide vs escalate)
- Success Metrics (how to measure effectiveness)
- Usage Guidelines (when and how to use effectively)

**Quality checks:**

- Ensure agent follows established naming conventions
- Verify color categorization is appropriate
- Confirm Strategic Journal Policy matches current template
- Validate Persistent Output Requirement is included
