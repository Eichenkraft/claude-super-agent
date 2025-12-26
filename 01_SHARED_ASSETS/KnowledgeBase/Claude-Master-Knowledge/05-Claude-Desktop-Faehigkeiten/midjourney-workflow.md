# Midjourney Storytelling Workflow

> Bild-Sequenzen mit Super Image Generator MCP

---

## Quick Reference

### Einzelbild

```python
generate_images(
    prompt="[ENGLISCH! Keywords mit Kommas]",
    model="flux-2-pro",
    aspect_ratio="9:16",
    num_outputs=1
)
```

### Bild-Sequenz (Storytelling)

```python
# SZENE 1: Anchor-Bild (OHNE Referenz)
result_1 = generate_images(
    prompt="[Szene 1 Prompt]",
    model="flux-2-pro",
    aspect_ratio="9:16"
)

# SZENE 2+: MIT Referenz für Konsistenz
result_2 = generate_images(
    prompt="[Szene 2 Prompt]",
    model="flux-2-pro",
    aspect_ratio="9:16",
    reference_images=["<URL_von_Szene_1>"]
)
```

---

## Verfügbare Modelle

| Modell | Qualität | Use Case |
|--------|----------|----------|
| flux-2-pro | ⭐⭐⭐⭐⭐ | Standard, beste Qualität |
| flux-kontext | ⭐⭐⭐⭐ | Kontext-bewusst, Konsistenz |
| flux-2-dev | ⭐⭐⭐ | Schnell, gut |
| flux-schnell | ⭐⭐ | Schnellste |

---

## Aspect Ratios

| Ratio | Use Case |
|-------|----------|
| 9:16 | Instagram Reels/Stories, TikTok (Standard) |
| 16:9 | YouTube, Landscape |
| 1:1 | Instagram Posts |
| 4:5 | Instagram Feed |

---

## Prompt-Regeln

✅ **DO:**
- IMMER auf Englisch
- Keywords mit Kommas trennen
- Positive Formulierungen
- 5-7 Schlüsselelemente
- Spezifisch sein

❌ **DON'T:**
- Ganze Sätze
- "without", "no", "don't" (negativ)
- Vage Beschreibungen
- Zu lange Prompts

---

## Prompt-Struktur

```
[SUBJECT] [ACTION] [ENVIRONMENT] [CAMERA] [LIGHTING] [STYLE] [MOOD]
```

**Beispiel:**
```
young woman with red curly hair, dancing joyfully, 
urban rooftop at sunset, wide shot, golden hour lighting, 
cinematic photography, joyful atmosphere
```

---

## Magic Words

**Realismus:**
```
shot on Canon EOS R5, 85mm f/1.4, shallow depth of field, 
bokeh, natural lighting, professional color grading
```

**Cinematic:**
```
cinematic composition, anamorphic lens, film grain, 
color graded, dramatic lighting, volumetric fog
```

**Emotion:**
```
intense expression, tears streaming, joyful smile, 
determined look, contemplative mood
```

---

## Charakter-Konsistenz

### Mit Reference Images
```python
# Jede Szene mit Anchor-Referenz
generate_images(
    prompt="same young woman with red hair...",
    reference_images=["<character_anchor_URL>"]
)
```

### Mit Character Manager
```python
# Charakter speichern
save_character(
    character_id="protagonist",
    description="Young woman, red curly hair, green eyes, freckles",
    references=["<URL_1>", "<URL_2>"]
)

# Später abrufen
list_characters()
```

---

## Workflow für Story-Sequenz

1. **User gibt Script/Story**
2. **Frage nach Modus:** Nur Prompts oder direkte Generation?
3. **Story Breakdown:** Szenen identifizieren
4. **Prompts generieren** (in separaten Code-Blöcken)
5. **Bei Generation:** Szene 1 ohne Referenz → Szene 2+ mit Referenz
6. **Fortschritt zeigen:** 🎨 Generiere... ✅ Fertig!

---

## Troubleshooting

| Problem | Lösung |
|---------|--------|
| Inkonsistente Charaktere | flux-kontext verwenden, reference_images |
| Style-Drift | Alle Szenen mit Szene 1 als Referenz |
| Niedrige Qualität | flux-2-pro, Quality Keywords hinzufügen |
| Falsches Format | aspect_ratio explizit setzen |
