# CODEX_INSTRUCTIONS Template

> Standard-Brief für Codex CLI Delegation

---

## Das Template

```markdown
# Mission
[Ein Satz: Was muss gebaut werden und warum]

# Context
[Kurzer Kontext: Produktziel, Constraints, User-Erwartungen]

# Target Directory
D:\MCPs\[projekt-name]

# Tech Stack
[Sprachen, Frameworks, Runtimes, Versionen]

# Entry Points
[Welche Dateien/Ordner zuerst inspizieren]

# Constraints
- [Non-Negotiables: Struktur, Style, Plattform]
- [Security oder Data Handling Regeln]
- [Keine Network-Calls wenn nicht nötig]

# Inputs
- Source material: [Links oder Dateipfade]
- APIs/keys: [Placeholder oder env var Namen - KEINE Secrets!]

# Required Output
- [Dateien die erstellt/geändert werden]
- [Commands die ausgeführt werden sollen]
- [Tests die laufen sollen]

# Implementation Plan
1) [Schritt 1]
2) [Schritt 2]
3) [Schritt 3]

# Success Criteria
- [Funktionale Kriterien]
- [Behavioral oder UX Kriterien]
- [Build/Test Kriterien]

# Risks / Watchouts
- [Potenzielle Fallstricke]
- [Edge Cases]

# Briefing Notes
[Vorherige Versuche, bekannte Fehler, Constraints]
```

---

## Ausführung

```powershell
cd D:\MCPs\projekt-name
git init  # Falls noch kein Repo
codex exec --sandbox danger-full-access "<brief>"
```

---

## Timeouts

| Scope | Timeout |
|-------|---------|
| 200-500 LOC | 20 Minuten |
| 500-1000 LOC | 40 Minuten |
| Bei Timeout | In Phasen aufteilen |

---

## Verifizierung nach Codex

1. ✅ Git status clean
2. ✅ Erwartete Dateien vorhanden
3. ✅ Key Files durchlesen (Header, Config, Core Logic)
4. ✅ Tests/Smoke Command ausführen
5. ✅ Success Criteria einzeln prüfen

---

## Häufige Fehler

| Fehler | Lösung |
|--------|--------|
| Not a git repo | `git init` |
| Permission denied | Pfad nach D:\MCPs\ verschieben |
| Timeout | Scope reduzieren, Phasen bilden |
| Broken imports | Pfade und Exports prüfen |
| Missing dependencies | package.json ergänzen, install |
