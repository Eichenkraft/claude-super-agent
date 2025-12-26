# Claude Master Knowledge Base

> Vollständige Wissensbasis für Claude Desktop Beratung und Skill-Entwicklung

---

## 🎯 Zwei Assistenten-Varianten

Diese Knowledge Base bietet **zwei alternative System Prompts** zum Testen:

### Option A: CLAUDE.md (Empfohlen für Claude Code / Projects)
- **Datei:** `CLAUDE.md`
- **Stil:** Knapp, progressive Disclosure mit @Referenzen
- **Token-Verbrauch:** ~500 Tokens
- **Best für:** Claude Code, Claude Projects mit Knowledge Base
- **Prinzip:** Verweist auf Detail-Dateien statt alles zu erklären

### Option B: MASTER-SYSTEM-PROMPT.md (Empfohlen für Custom GPT / Gems)
- **Datei:** `MASTER-SYSTEM-PROMPT.md`
- **Stil:** Vollständig, selbstständig, alle Details enthalten
- **Token-Verbrauch:** ~2500 Tokens
- **Best für:** Custom GPTs, Gemini Gems, standalone Nutzung
- **Prinzip:** Alles in einer Datei, keine Referenzen nötig

---

## 📁 Vollständige Struktur

```
D:\Claude-Master-Knowledge\
│
├── README.md                          ← Du bist hier
├── CLAUDE.md                          ← ⭐ Option A: Knapper Prompt mit @Referenzen
├── MASTER-SYSTEM-PROMPT.md            ← ⭐ Option B: Vollständiger Standalone Prompt
│
├── 01-Grundlagen/
│   └── claude-philosophie.md          ← Charakter, Ethik, Kommunikation
│
├── 02-Skills-System/
│   ├── skill-spec.md                  ← Agent Skills Spezifikation
│   ├── codex-instructions-template.md ← ⭐ Codex Brief Template
│   └── beispiel-skill-automation.md   ← Praktisches Skill-Beispiel
│
├── 03-MCP-Integration/
│   └── mcp-grundlagen.md              ← MCP Protokoll & Konfiguration
│
├── 04-System-Prompts/
│   ├── 10-komponenten-framework.md    ← Anthropic Prompt Framework
│   └── prompt-engineering-best-practices.md
│
└── 05-Claude-Desktop-Faehigkeiten/
    ├── vollstaendige-faehigkeiten.md  ← Alle MCPs, Tools, Skills
    ├── artifacts-dokumentation.md      ← Artifacts System komplett
    └── midjourney-workflow.md          ← ⭐ Bild-Generierung Workflow
```

---

## 🚀 Quick Start

### Für Claude Project (Option A empfohlen)
1. Neues Project in Claude erstellen
2. **Alle .md Dateien** als Knowledge Base hochladen
3. `CLAUDE.md` Inhalt in Project Instructions kopieren
4. Die @Referenzen funktionieren automatisch mit der Knowledge Base

### Für Claude Code
1. `CLAUDE.md` ins Repository-Root kopieren
2. Zusätzliche Dateien in `.claude/rules/` oder als Imports

### Für Custom GPT (Option B empfohlen)
1. Custom GPT erstellen
2. **"Standard Version"** aus `MASTER-SYSTEM-PROMPT.md` in Instructions
3. Optional: Weitere Dateien als Knowledge hochladen

### Für Gemini Gem (Option B - gekürzt)
1. Gem erstellen
2. **"Minimale Version"** aus `MASTER-SYSTEM-PROMPT.md` verwenden

---

## 📋 Datei-Übersicht

| Datei | Zweck | Für Option |
|-------|-------|------------|
| **CLAUDE.md** | Knapper Prompt mit Referenzen | A |
| **MASTER-SYSTEM-PROMPT.md** | Vollständiger Standalone | B |
| vollstaendige-faehigkeiten.md | Alle MCPs, Tools, Skills | A (Referenz) |
| artifacts-dokumentation.md | Artifacts System | A (Referenz) |
| codex-instructions-template.md | Codex Brief Format | A (Referenz) |
| midjourney-workflow.md | Bild-Generierung | A (Referenz) |
| skill-spec.md | Skill Format Spezifikation | A (Referenz) |
| mcp-grundlagen.md | MCP Protokoll | A (Referenz) |
| claude-philosophie.md | Charakter & Ethik | Hintergrund |

---

## 🔑 Kern-Workflows (beide Optionen)

### 1. Codex-Delegation
```
Trigger: 4+ Dateien ODER 200+ LOC ODER MCP-Server
Grund: Codex unbegrenzt, Claude Tokens limitiert
Workflow: Claude → Brief → Codex → Verifizierung
```

### 2. Bild-Generierung
```
Tool: super-image-generator MCP
Modell: flux-2-pro (Standard)
Sequenzen: Szene 1 ohne Referenz → Szene 2+ mit reference_images
```

### 3. Skill-Erstellung
```
Format: SKILL.md mit YAML Frontmatter
Regel: Immer vollständige, korrekt formatierte Datei liefern
```

### 4. Artifacts
```
React: .jsx mit Tailwind, lucide-react, recharts
Diagramme: .mermaid
Speicher: window.storage (NICHT localStorage!)
```

---

## 🛠️ Verfügbare MCPs

| MCP | Zweck |
|-----|-------|
| **Coding Dream Team** | Codex-Delegation |
| **Super Image Generator** | Flux Bildgenerierung |
| **Desktop Commander** | System-Kontrolle |
| **n8n Workflow** | Automatisierung |
| **Hostinger** | VPS & Hosting |
| **Hugging Face** | ML-Modelle |
| **Windows MCP** | GUI-Automation |
| **Spotify** | Musik-Steuerung |

---

## 📚 Verfügbare Skills

**User Skills (Custom):**
- codex-coding-manager
- midjourney-storytelling
- mcp-server-dev

**Public Skills (Built-in):**
- docx, pdf, pptx, xlsx
- frontend-design
- product-self-knowledge

---

## 🎯 Was der Assistent kann

✅ Fix und fertige SKILL.md Dateien im korrekten Format schreiben
✅ MCP-Server konfigurieren und troubleshooten
✅ Interaktive Artifacts erstellen (React, Mermaid, HTML)
✅ Komplexe Coding-Aufgaben an Codex delegieren
✅ Bilder mit Flux 2 Pro generieren
✅ Bei allen Claude Desktop Fragen beraten

---

## 🔄 Unterschied: CLAUDE.md vs MASTER-SYSTEM-PROMPT.md

| Aspekt | CLAUDE.md | MASTER-SYSTEM-PROMPT.md |
|--------|-----------|-------------------------|
| **Länge** | ~120 Zeilen | ~550 Zeilen |
| **Tokens** | ~500 | ~2500 |
| **Stil** | Referenzen zu anderen Dateien | Alles selbst enthalten |
| **Benötigt** | Knowledge Base mit allen Dateien | Nur sich selbst |
| **Best für** | Claude Code, Claude Projects | Custom GPT, Gemini Gems |
| **Update** | Änderungen in Referenz-Dateien | Änderungen in einer Datei |

---

## 📝 Changelog

- **2025-12-25**: v2.0
  - CLAUDE.md hinzugefügt (knapper Prompt mit @Referenzen)
  - codex-instructions-template.md erstellt
  - midjourney-workflow.md erstellt
  - README mit beiden Optionen aktualisiert

- **2025-12-25**: v1.0 Initial Release
  - Master System Prompt mit Codex-Workflow
  - Vollständige Fähigkeiten-Dokumentation
  - Artifacts-Dokumentation
  - Skills-Spezifikation
  - MCP-Grundlagen
