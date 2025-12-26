# Vollständige Fähigkeiten-Übersicht

> Alle verfügbaren Tools, MCPs und Skills dieser Claude Desktop Installation

---

## 🔧 MCP Server (Model Context Protocol)

### 1. Desktop Commander
**Zweck:** Vollständige System-Kontrolle unter Windows
```
Tools:
- read_file / write_file / edit_block - Dateien lesen/schreiben/bearbeiten
- create_directory / list_directory - Verzeichnis-Operationen
- move_file / search_files / get_file_info - Datei-Management
- start_process / interact_with_process - Terminal & Prozesse
- start_search / get_more_search_results - Datei-/Content-Suche
- list_sessions / force_terminate - Prozess-Management
```

### 2. Filesystem MCP
**Zweck:** Zusätzlicher Dateisystem-Zugriff
```
Tools:
- read_file / read_text_file / read_multiple_files
- write_file / edit_file / create_directory
- list_directory / directory_tree / move_file
- search_files / get_file_info
- copy_file_user_to_claude - Dateien in Claude's Computer kopieren
```

### 3. Coding Dream Team (Codex Integration)
**Zweck:** Komplexe Coding-Aufgaben an Codex CLI delegieren
```
Tools:
- build_feature - Autonome Pipeline: Claude plant → Codex codet → Tests
- fix_test_failures - Codex analysiert Fehler und generiert Fixes
- codex_execute - Direkter Codex Terminal-Zugang
- get_session / list_sessions - Session-Management
```
**⚠️ WICHTIG:** Standard-Workflow für 4+ Dateien oder 200+ LOC!

### 4. Super Image Generator / Replicate-Gewoben
**Zweck:** AI-Bildgenerierung mit Flux, Video-Erstellung
```
Tools:
- generate_images - Bilder mit Flux 2 Pro/Dev, Referenz-Bilder
- generate_video - Videos mit Luma Ray, MiniMax
- edit_image - Bild-Bearbeitung mit FAL
- analyze_image / optimize_prompt_with_vision - Bild-Analyse
- list_models / get_model_info / get_categories
- save_character / list_characters - Charakter-Konsistenz
- list_storage / purge_storage - Asset-Management
```

### 5. n8n Workflow MCP
**Zweck:** Workflow-Automatisierung
```
Tools:
- search_workflows / get_workflow_details
- execute_workflow - Workflows ausführen
- generate_workflow - KI-generierte Workflows
- create_workflow / update_workflow / delete_workflow
- activate_workflow / deactivate_workflow
- list_executions - Ausführungs-Historie
```

### 6. Hugging Face MCP
**Zweck:** ML-Modelle, Datasets, Papers, Spaces
```
Tools:
- model_search / dataset_search / paper_search / space_search
- hub_repo_details - Repository-Details
- dynamic_space - Spaces nutzen (OCR, TTS, etc.)
- hf_doc_search / hf_doc_fetch - Dokumentation
```

### 7. Hostinger MCP
**Zweck:** VPS & Hosting-Management
```
Tools:
- Website Deployment (WordPress, JS, Static)
- DNS Management
- Domain-Verwaltung (Kauf, Lock, Forwarding)
- VPS-Steuerung (Start, Stop, Firewall, Docker)
- Billing & Subscriptions
```

### 8. Windows MCP
**Zweck:** GUI-Automation unter Windows
```
Tools:
- App-Tool (launch, resize, switch)
- State-Tool - Desktop-Status erfassen
- Click-Tool / Type-Tool / Scroll-Tool
- Drag-Tool / Move-Tool / Shortcut-Tool
- Wait-Tool / Scrape-Tool
```

### 9. Spotify MCP
**Zweck:** Musik-Steuerung
```
Tools:
- play / pause / playpause / next_track / previous_track
- play_track (URI) / get_current_track
- set_volume / get_volume
- set_shuffle / set_repeat
```

---

## 🌐 Integrierte Web-Tools

### Web Search & Fetch
```
- web_search - Echtzeit-Websuche
- web_fetch - Webseiten-Inhalte abrufen
```

### Google Integration
```
- google_drive_search / google_drive_fetch - Drive-Dokumente
- search_gmail_messages / read_gmail_thread - E-Mail-Zugriff
- read_gmail_profile - Profil-Informationen
```

### Memory & History
```
- conversation_search - Vergangene Chats durchsuchen
- recent_chats - Letzte Konversationen abrufen
- memory_user_edits - Memory verwalten (view/add/remove/replace)
```

---

## 💻 Computer Use (Linux Container)

### Verfügbare Tools
```
- bash_tool - Bash-Befehle ausführen
- str_replace - Dateien bearbeiten
- view - Dateien/Verzeichnisse anzeigen
- create_file - Neue Dateien erstellen
- present_files - Dateien dem User präsentieren
```

### Dateisystem-Struktur
```
/home/claude/              # Arbeitsverzeichnis
/mnt/user-data/uploads/    # User-Uploads (read-only)
/mnt/user-data/outputs/    # Finale Outputs für User
/mnt/skills/public/        # Öffentliche Skills (docx, pdf, pptx, xlsx, etc.)
/mnt/skills/user/          # User-Custom-Skills
/mnt/skills/examples/      # Beispiel-Skills
```

---

## 📚 Verfügbare Skills

### Public Skills (Built-in)
| Skill | Beschreibung |
|-------|--------------|
| docx | Word-Dokumente erstellen/bearbeiten |
| pdf | PDF-Manipulation, Formulare, Extraktion |
| pptx | PowerPoint-Präsentationen |
| xlsx | Excel-Tabellen mit Formeln |
| frontend-design | Hochwertige UI/UX Designs |
| product-self-knowledge | Anthropic Produkt-Wissen |

### User Skills (Custom)
| Skill | Beschreibung |
|-------|--------------|
| **codex-coding-manager** | Codex-Delegation für komplexe Coding-Tasks |
| **midjourney-storytelling** | Bild-Prompt-Sequenzen + Flux-Generation |
| **mcp-server-dev** | MCP-Server Entwicklung |

### Example Skills
| Skill | Beschreibung |
|-------|--------------|
| skill-creator | Eigene Skills erstellen |
| mcp-builder | MCP-Server bauen |
| doc-coauthoring | Dokumenten-Co-Authoring |
| web-artifacts-builder | Komplexe Web-Artifacts |
| theme-factory | Theme-Erstellung |
| canvas-design | Visuelle Kunst erstellen |
| algorithmic-art | Generative Kunst mit p5.js |

---

## 🎨 Artifacts System

### Unterstützte Typen mit Rendering
| Extension | Typ | Rendering |
|-----------|-----|-----------|
| .md | Markdown | ✅ Gerendert |
| .html | HTML | ✅ Interaktiv |
| .jsx | React | ✅ Interaktiv |
| .mermaid | Diagramme | ✅ Visualisiert |
| .svg | Vektorgrafik | ✅ Angezeigt |
| .pdf | PDF | ✅ Angezeigt |

### React Artifact Bibliotheken
```javascript
// Verfügbar:
import { useState, useEffect } from "react"
import { Camera, Heart, ... } from "lucide-react"
import { LineChart, BarChart, ... } from "recharts"
import * as d3 from "d3"
import * as THREE from "three"
import _ from "lodash"
import * as math from "mathjs"
// shadcn/ui Komponenten
import { Alert, Button, Card, ... } from "@/components/ui/..."
```

### Persistent Storage für Artifacts
```javascript
// Daten speichern (über Sessions hinweg!)
await window.storage.set('key', JSON.stringify(data));
await window.storage.get('key');
await window.storage.delete('key');
await window.storage.list('prefix:');

// Shared Data (für alle User sichtbar)
await window.storage.set('key', data, true); // shared=true
```

---

## 🔄 Standard-Workflows

### Komplexe Coding-Aufgaben → Codex
```
Trigger: 4+ Dateien ODER 200+ LOC ODER MCP-Server
Workflow:
1. Claude: Scope definieren, Brief erstellen
2. Codex: Implementation (codex exec --sandbox danger-full-access)
3. Claude: Verifizierung, Fixes, Delivery
```

### Bild-Generierung → Super Image Generator
```
Trigger: Bilder erstellen, Storytelling, Visualisierungen
Workflow:
1. Prompts mit midjourney-storytelling Skill erstellen
2. generate_images mit Flux 2 Pro aufrufen
3. Reference Images für Konsistenz nutzen
```

### Dokumente erstellen → Skills
```
Trigger: Word, Excel, PowerPoint, PDF
Workflow:
1. Skill SKILL.md lesen (/mnt/skills/public/[type]/SKILL.md)
2. Instruktionen befolgen
3. Datei in /mnt/user-data/outputs/ speichern
4. present_files aufrufen
```
