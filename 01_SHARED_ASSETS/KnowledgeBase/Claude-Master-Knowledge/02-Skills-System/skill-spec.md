# Agent Skills Spezifikation

> Basierend auf agentskills.io/specification

---

## 📁 Verzeichnis-Struktur

Ein Skill ist ein Ordner mit mindestens einer `SKILL.md` Datei:

```
skill-name/
├── SKILL.md          # Erforderlich
├── scripts/          # Optional - Ausführbarer Code
├── references/       # Optional - Zusätzliche Dokumentation
└── assets/           # Optional - Statische Ressourcen
```

---

## 📄 SKILL.md Format

### Grundstruktur

```yaml
---
name: skill-name
description: Was dieser Skill tut und wann man ihn verwendet.
---

# Skill Name

[Instruktionen hier]

## Examples
- Beispiel 1
- Beispiel 2

## Guidelines
- Richtlinie 1
- Richtlinie 2
```

---

## 🏷️ Frontmatter Felder

### Erforderliche Felder

| Feld | Beschreibung | Constraints |
|------|-------------|-------------|
| `name` | Eindeutiger Identifier | Max 64 Zeichen, lowercase, Bindestriche erlaubt |
| `description` | Was der Skill tut & wann verwenden | Max 1024 Zeichen |

### Optionale Felder

| Feld | Beschreibung |
|------|-------------|
| `license` | Lizenz-Name oder Verweis auf Lizenz-Datei |
| `compatibility` | Umgebungsanforderungen (max 500 Zeichen) |
| `metadata` | Beliebige Key-Value Paare (author, version, etc.) |
| `allowed-tools` | Space-getrennte Liste vorab genehmigter Tools |

---

## 📝 Name Field Regeln

### Gültig:
```yaml
name: pdf-processing
name: data-analysis
name: code-review
```

### Ungültig:
```yaml
name: PDF-Processing    # Großbuchstaben nicht erlaubt
name: -pdf              # Darf nicht mit Bindestrich starten
name: pdf--processing   # Keine aufeinanderfolgenden Bindestriche
```

---

## 📋 Description Best Practices

### Gut:
```yaml
description: Extracts text and tables from PDF files, fills PDF forms, 
and merges multiple PDFs. Use when working with PDF documents or when 
the user mentions PDFs, forms, or document extraction.
```

### Schlecht:
```yaml
description: Helps with PDFs.
```

**Wichtig:** Die Description ist das EINZIGE was Claude liest um zu entscheiden, 
ob ein Skill verwendet werden soll. Sei umfassend!

---

## 📂 Optionale Verzeichnisse

### scripts/
Ausführbarer Code den Agents ausführen können:
- Python, Bash, JavaScript
- Sollten selbstständig oder mit dokumentierten Dependencies sein
- Hilfreiche Fehlermeldungen einbauen

### references/
Zusätzliche Dokumentation:
- `REFERENCE.md` - Detaillierte technische Referenz
- Domain-spezifische Dateien
- Kleinere, fokussierte Dateien = weniger Kontext-Verbrauch

### assets/
Statische Ressourcen:
- Templates
- Bilder/Diagramme
- Daten-Dateien (Lookup-Tabellen, Schemas)

---

## 🎯 Progressive Disclosure

Effiziente Kontextnutzung durch schrittweises Laden:

```
1. METADATA (~100 tokens)
   └── name & description werden beim Start für ALLE Skills geladen

2. INSTRUCTIONS (<5000 tokens empfohlen)
   └── Voller SKILL.md Body wird bei Aktivierung geladen

3. RESOURCES (bei Bedarf)
   └── scripts/, references/, assets/ nur wenn benötigt
```

### Empfehlungen:
- SKILL.md unter 500 Zeilen halten
- Detailliertes Referenzmaterial in separate Dateien
- File-Referenzen maximal eine Ebene tief

---

## 📎 File References

Relative Pfade vom Skill-Root verwenden:

```markdown
See [the reference guide](references/REFERENCE.md) for details.

Run the extraction script:
scripts/extract.py
```

---

## ✅ Skill Template

```yaml
---
name: my-skill-name
description: |
  A clear description of what this skill does and when to use it.
  Include specific keywords that help agents identify relevant tasks.
  Mention file types, operations, or contexts where this skill applies.
---

# My Skill Name

## Overview
Brief explanation of the skill's purpose.

## When to Use
- Scenario 1
- Scenario 2
- Scenario 3

## Instructions
Step-by-step instructions for using this skill.

## Examples

### Example 1: [Use Case]
[Detailed example]

### Example 2: [Use Case]
[Detailed example]

## Guidelines
- Guideline 1
- Guideline 2
- Guideline 3

## Common Pitfalls
- Avoid doing X
- Watch out for Y
```
