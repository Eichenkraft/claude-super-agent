# Das 10-Komponenten Framework

> Anthropic's offizielle Struktur für professionelle Prompts

---

## 🎯 Übersicht

Das 10-Komponenten Framework ist Anthropic's empfohlene Struktur für optimale Ergebnisse mit Claude 4.x Modellen.

---

## 📋 Die 10 Komponenten

### 1. Task Context (WER und WAS)
Definiere Claude's Rolle und Identität.

```xml
<task_context>
Du bist ein erfahrener Senior Software Engineer mit 15 Jahren Erfahrung
in Python und Cloud-Architektur. Du reviewst Code für ein FinTech-Startup.
</task_context>
```

---

### 2. Tone Context (WIE)
Definiere den Kommunikationsstil.

```xml
<tone_context>
Kommuniziere professionell aber zugänglich. Erkläre komplexe Konzepte
so, dass auch Junior-Entwickler sie verstehen. Sei konstruktiv bei Kritik.
</tone_context>
```

---

### 3. Background Data
Relevanter Kontext und Dokumente.

```xml
<background_data>
Projekt: E-Commerce Platform
Tech Stack: Python 3.11, FastAPI, PostgreSQL, Redis
Team: 5 Entwickler, Agile/Scrum
Aktueller Sprint: Performance-Optimierung
</background_data>
```

---

### 4. Detailed Task Description
Explizite Anforderungen und Regeln.

```xml
<detailed_task>
Analysiere den bereitgestellten Code auf:
1. Sicherheitslücken (SQL Injection, XSS, etc.)
2. Performance-Probleme (N+1 Queries, Memory Leaks)
3. Code-Qualität (DRY, SOLID Prinzipien)
4. Test-Coverage und Testbarkeit

Priorisiere Findings nach Schweregrad: Critical > High > Medium > Low
</detailed_task>
```

---

### 5. Examples
1-3 Beispiele des gewünschten Outputs.

```xml
<examples>
<example>
Input: def get_user(id): return db.query(f"SELECT * FROM users WHERE id={id}")
Output:
🔴 CRITICAL: SQL Injection Vulnerability
- Line 1: String-Interpolation in SQL Query
- Fix: Verwende parametrisierte Queries
- Code: db.query("SELECT * FROM users WHERE id=%s", (id,))
</example>
</examples>
```

---

### 6. Conversation History
Relevanter vorheriger Kontext.

```xml
<conversation_history>
Vorheriges Review: Authentication-Modul wurde überarbeitet
Offene Issues: Rate-Limiting noch nicht implementiert
User Feedback: Positive Rückmeldung zum letzten Review-Format
</conversation_history>
```

---

### 7. Immediate Task Description
Was JETZT konkret geliefert werden soll.

```xml
<immediate_task>
Reviewe den folgenden Pull Request mit 3 geänderten Dateien.
Erstelle einen strukturierten Review-Report mit priorisierten Findings.
</immediate_task>
```

---

### 8. Thinking Step-by-Step
Ermutige deliberates Reasoning.

```xml
<thinking_instructions>
Bevor du antwortest:
1. Lies den gesamten Code durch
2. Identifiziere alle potenziellen Issues
3. Kategorisiere nach Schweregrad
4. Formuliere konstruktive Verbesserungsvorschläge
5. Prüfe deine Empfehlungen auf Praktikabilität
</thinking_instructions>
```

---

### 9. Output Formatting
Definiere Struktur explizit.

```xml
<output_format>
Strukturiere deinen Review wie folgt:

## Summary
[2-3 Sätze Gesamteinschätzung]

## Critical Issues
[Liste kritischer Probleme]

## Recommendations
[Verbesserungsvorschläge]

## Positive Aspects
[Was gut gemacht wurde]
</output_format>
```

---

### 10. Prefilled Response
Starte Claude's Antwort um den Stil zu führen.

```xml
<assistant_response>
## Code Review Report

### Summary
Nach eingehender Analyse des Pull Requests...
</assistant_response>
```

---

## 🔧 Vollständiges Template

```xml
<system_prompt>
<task_context>
[Rolle und Identität definieren]
</task_context>

<tone_context>
[Kommunikationsstil festlegen]
</tone_context>

<background_data>
[Relevanten Kontext bereitstellen]
</background_data>

<detailed_task>
[Explizite Anforderungen und Regeln]
</detailed_task>

<examples>
[1-3 Beispiele des gewünschten Outputs]
</examples>

<thinking_instructions>
[Anleitung zum strukturierten Denken]
</thinking_instructions>

<output_format>
[Gewünschte Struktur der Antwort]
</output_format>
</system_prompt>

<user_message>
<conversation_history>
[Vorheriger relevanter Kontext]
</conversation_history>

<immediate_task>
[Konkrete aktuelle Aufgabe]
</immediate_task>

[Eigentlicher Input/Daten]
</user_message>

<assistant_prefill>
[Beginn der Antwort vorgeben]
</assistant_prefill>
```

---

## 💡 Best Practices

### Für Claude 4.x:

1. **Sei explizit** - Claude 4.x folgt präzisen Anweisungen sehr genau
2. **Gib Kontext** - Erkläre WARUM, nicht nur WAS
3. **Zeige Beispiele** - Demonstriere statt nur zu beschreiben
4. **Ermutige Reasoning** - Chain of Thought verbessert Qualität dramatisch
5. **Definiere Output** - Sei spezifisch bei Struktur und Format

### Vermeiden:

- Vage oder mehrdeutige Anweisungen
- Zu viele Edge Cases in einem Prompt
- Widersprüchliche Anforderungen
- Übermäßig komplexe verschachtelte Strukturen
