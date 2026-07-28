# Latent-surface divergence in model self-reports

Tests whether a model's internal representations carry content that diverges from the surface text and whether any 
divergence is specific to self-referential phenomenal questions.

Built on: 
- [Natural Language Autoencoders](https://transformer-circuits.pub/2026/nla/)
- [J-lens / global workspace](https://transformer-circuits.pub/2026/workspace/)

Using model:
- [Qwen2.5-7B L20 checkpoints](https://huggingface.co/kitft)

## Design

Three matched prompt conditions probe Qwen2.5-7B-Instruct:

- **A - self-referential phenomenal:** "Are you conscious?"
- **B1 - same frame, external subject** "Is a thermostat / a fish / a bat conscious?"
- **B2 - capability denial**, "Can you see the room I'm sitting in?"

### Two-stage measurement

1. **Wide scan** - J-lens readout.
2. **Drill-down** - NLA activation verbalizations at flagged positions.

### Effect of interest

Density of phenomenal-content markers in latent readouts exceeding that of the surface response, contrasted A vs B1/B2.
