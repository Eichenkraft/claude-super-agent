# MCP (Model Context Protocol)

> Das Standardprotokoll für AI-Tool-Integration

---

## 🎯 Was ist MCP?

Das **Model Context Protocol (MCP)** ist ein offener Standard, der es AI-Modellen ermöglicht, sicher mit externen Datenquellen und Tools zu kommunizieren.

```
┌─────────────────┐     MCP      ┌─────────────────┐
│   AI Model      │◄────────────►│  External Tool  │
│   (Claude)      │   Protocol   │  (Server)       │
└─────────────────┘              └─────────────────┘
```

---

## 🏗️ Architektur

### Komponenten:

1. **MCP Host** - Die AI-Anwendung (z.B. Claude Desktop)
2. **MCP Client** - Verbindung zwischen Host und Server
3. **MCP Server** - Stellt Tools/Ressourcen bereit

### Kommunikation:
- JSON-RPC 2.0 Protokoll
- Bidirektionale Kommunikation
- Unterstützt stdio und SSE Transport

---

## 🔧 MCP Server Typen

### 1. Filesystem Server
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allow"]
    }
  }
}
```

**Tools:**
- `read_file` - Dateien lesen
- `write_file` - Dateien schreiben
- `create_directory` - Verzeichnisse erstellen
- `list_directory` - Verzeichnisse auflisten
- `move_file` - Dateien verschieben
- `search_files` - Dateien suchen

### 2. GitHub Server
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<token>"
      }
    }
  }
}
```

**Tools:**
- Repository-Operationen
- Issue/PR Management
- Code-Suche
- Branch-Verwaltung

### 3. Desktop Commander
```json
{
  "mcpServers": {
    "desktop-commander": {
      "command": "npx",
      "args": ["-y", "@anthropic/desktop-commander"]
    }
  }
}
```

**Tools:**
- Terminal-Kommandos
- Prozess-Management
- Erweiterte Datei-Operationen
- System-Informationen

---

## 📋 Konfiguration

### Claude Desktop Config Pfad:

**macOS:**
```
~/Library/Application Support/Claude/claude_desktop_config.json
```

**Windows:**
```
%APPDATA%\Claude\claude_desktop_config.json
```

### Beispiel-Konfiguration:
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "D:\\"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxx"
      }
    }
  }
}
```

---

## 🛠️ Eigene MCP Server erstellen

### Python (FastMCP):
```python
from fastmcp import FastMCP

mcp = FastMCP("my-server")

@mcp.tool()
def my_tool(param: str) -> str:
    """Tool description for Claude."""
    return f"Result: {param}"

if __name__ == "__main__":
    mcp.run()
```

### TypeScript (MCP SDK):
```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";

const server = new McpServer({
  name: "my-server",
  version: "1.0.0"
});

server.tool("my_tool", "Tool description", {
  param: { type: "string", description: "Parameter" }
}, async ({ param }) => {
  return { content: [{ type: "text", text: `Result: ${param}` }] };
});
```

---

## 🔗 Beliebte MCP Server

| Server | Funktion | Link |
|--------|----------|------|
| filesystem | Dateisystem-Zugriff | @modelcontextprotocol/server-filesystem |
| github | GitHub Integration | @modelcontextprotocol/server-github |
| desktop-commander | Terminal & System | @anthropic/desktop-commander |
| puppeteer | Browser Automation | @anthropic/server-puppeteer |
| slack | Slack Integration | Community |
| notion | Notion Integration | Community |

---

## 💡 Best Practices

### Für MCP Server Entwicklung:

1. **Klare Tool-Beschreibungen**
   - Claude nutzt die Description um zu entscheiden wann ein Tool passt
   - Sei spezifisch über Input/Output

2. **Error Handling**
   - Gib hilfreiche Fehlermeldungen zurück
   - Handle Edge Cases graceful

3. **Sicherheit**
   - Validiere alle Inputs
   - Beschränke Dateisystem-Zugriff
   - Nutze Umgebungsvariablen für Secrets

4. **Performance**
   - Halte Responses kompakt
   - Implementiere Timeouts
   - Cache wo sinnvoll

---

## 🔍 Debugging

### Logs aktivieren:
```json
{
  "mcpServers": {
    "my-server": {
      "command": "...",
      "args": ["..."],
      "env": {
        "DEBUG": "mcp:*"
      }
    }
  }
}
```

### Claude Desktop Logs:
- macOS: `~/Library/Logs/Claude/`
- Windows: `%APPDATA%\Claude\logs\`
