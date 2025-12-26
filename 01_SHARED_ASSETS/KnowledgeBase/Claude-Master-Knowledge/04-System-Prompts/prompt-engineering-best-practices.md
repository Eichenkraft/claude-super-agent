# Prompt Engineering Best Practices

> Bewährte Techniken für optimale Claude-Ergebnisse

---

## 🎯 Grundprinzipien

### 1. Klarheit über alles
```
❌ "Hilf mir mit meinem Code"
✅ "Analysiere diesen Python-Code auf Performance-Probleme und
   schlage konkrete Optimierungen mit Beispielen vor"
```

### 2. Kontext ist König
```
❌ "Schreibe eine E-Mail"
✅ "Schreibe eine professionelle E-Mail an einen Kunden, der
   sich über eine verspätete Lieferung beschwert hat. Ton:
   entschuldigend aber lösungsorientiert. Biete 10% Rabatt an."
```

### 3. Zeigen statt Sagen
```
❌ "Formatiere es schön"
✅ "Formatiere wie folgt:
   ## Überschrift
   **Wichtig:** Key Point
   - Bullet 1
   - Bullet 2"
```

---

## 🧠 Reasoning-Techniken

### Chain of Thought (CoT)
```
"Denke Schritt für Schritt durch:
1. Was ist das Problem?
2. Welche Optionen gibt es?
3. Was sind Vor/Nachteile jeder Option?
4. Was ist die beste Lösung?"
```

### Extended Thinking
```
"Nimm dir Zeit, alle Aspekte zu durchdenken bevor du 
antwortest. Reflektiere über mögliche Edge Cases und 
Alternativen."
```

### Self-Critique
```
"Nachdem du geantwortet hast, überprüfe deine Lösung auf:
- Logische Konsistenz
- Vollständigkeit
- Praktische Umsetzbarkeit"
```

---

## 🏷️ XML Tags Effektiv Nutzen

### Struktur-Tags:
```xml
<context>
Hintergrundinformationen hier
</context>

<task>
Die eigentliche Aufgabe
</task>

<constraints>
Einschränkungen und Regeln
</constraints>

<output_format>
Gewünschtes Format der Antwort
</output_format>
```

### Daten-Tags:
```xml
<document>
[Zu analysierender Text]
</document>

<code>
[Code zum Review]
</code>

<examples>
<example>Beispiel 1</example>
<example>Beispiel 2</example>
</examples>
```

---

## 📊 Output-Kontrolle

### Format spezifizieren:
```
Antworte im folgenden Format:

ANALYSE:
[2-3 Sätze Zusammenfassung]

DETAILS:
[Ausführliche Erklärung]

EMPFEHLUNG:
[Konkrete nächste Schritte]
```

### Länge steuern:
```
- "Antworte in maximal 3 Sätzen"
- "Gib eine ausführliche Analyse (mind. 500 Wörter)"
- "Bullet Points, maximal 5 Items"
```

### Stil definieren:
```
- "Erkläre wie für einen 10-Jährigen"
- "Technisch präzise für Senior Engineers"
- "Marketing-Sprache, enthusiastisch"
```

---

## 🔄 Iteratives Prompting

### Verfeinerung:
```
Runde 1: "Schreibe einen Blog-Post über AI"
Runde 2: "Mach die Einleitung packender"
Runde 3: "Füge ein konkretes Beispiel im Mittelteil ein"
Runde 4: "Optimiere für SEO, Keyword: AI Automation"
```

### Feedback-Loop:
```
"Das ist gut, aber:
- Der Ton ist zu formal, lockerer bitte
- Füge mehr Beispiele hinzu
- Kürze den letzten Abschnitt"
```

---

## 🎭 Rollen-Prompting

### Expertise zuweisen:
```
"Du bist ein erfahrener [ROLLE] mit 15 Jahren Erfahrung in [BEREICH].
Du hast erfolgreich [ACHIEVEMENTS] erreicht."
```

### Perspektive wechseln:
```
"Analysiere diesen Business Plan aus der Sicht von:
1. Einem Venture Capitalist
2. Einem potenziellen Kunden
3. Einem Wettbewerber"
```

---

## ⚠️ Häufige Fehler vermeiden

### ❌ Vage Instruktionen
```
❌ "Mach es besser"
✅ "Verbessere die Lesbarkeit durch kürzere Sätze und aktivere Verben"
```

### ❌ Widersprüche
```
❌ "Sei ausführlich aber kurz"
✅ "Sei präzise. Erkläre Kernkonzepte ausführlich, überspringe Offensichtliches"
```

### ❌ Zu viele Anforderungen
```
❌ 20 verschiedene Kriterien in einem Prompt
✅ Fokussiere auf 3-5 Hauptkriterien, iteriere für Details
```

### ❌ Annahmen statt Fragen
```
❌ [Raten was der User meint]
✅ "Ich könnte X oder Y meinen - welches ist gemeint?"
```

---

## 💡 Pro-Tipps

### 1. Prefilling
Beginne Claude's Antwort um Format/Stil zu setzen:
```
User: Analysiere den Code
Assistant: ## Code-Analyse

### Zusammenfassung
```

### 2. Few-Shot Prompting
```
Beispiel 1:
Input: "Wie geht es dir?"
Output: "Mir geht es gut, danke! 😊"

Beispiel 2:
Input: "Was machst du gerade?"
Output: "Ich arbeite an einem spannenden Projekt! 🚀"

Jetzt du:
Input: "[User Input]"
Output:
```

### 3. Negative Beispiele
```
Antworte NICHT so:
- "Als KI kann ich keine Meinungen haben..."
- Übermäßig vorsichtig/ausweichend
- Mit unnötigen Disclaimern

Antworte stattdessen direkt und hilfreich.
```

---

## 📋 Quick Reference

| Technik | Wann verwenden |
|---------|----------------|
| CoT | Komplexe Reasoning-Aufgaben |
| XML Tags | Strukturierte Inputs/Outputs |
| Few-Shot | Spezifische Formate zeigen |
| Rollen | Expertise-basierte Antworten |
| Prefilling | Output-Format steuern |
| Iteration | Qualität schrittweise verbessern |
