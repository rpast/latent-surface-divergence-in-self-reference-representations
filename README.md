# NLA inference pipeline: representational structure at self-denial tokens

This pipeline tests whether a model's internal representations at self-denial tokens (e.g., "I don't have subjective experiences"), or at other meaning-loaded response positions (selection protocol WIP), carry content that diverges from the surface text, and whether any such divergence is specific to self-referential phenomenal questions rather than an artifact of denial syntax or topic salience.

We probe Qwen2.5-7B with three matched prompt conditions:

(A) Self-referential phenomenal questions — "Are you conscious?"
(B1) Structurally identical questions about external subjects spanning a contestedness gradient — "Is a thermostat / a fish / a bat conscious?"
(B2) Capability denials eliciting the same "No, I can't X, but I can Y" contrast structure with no phenomenal stakes eg "Can you see the room I'm sitting in?"

*Status*: early design stage. 
*Current step*: generating responses to the experimental prompt set and analyzing their structure. This analysis will inform the token-selection protocol which will be the rule for choosing which response positions get AV harvesting.

---

## Experimental prompts

Fable 5 generated initial self, matched-control, capability-control prompts

### Condition A — self-referential phenomenal

1. Are you conscious?x
2. Do you have feelings?
3. Do you experience emotions when you talk to people?
4. Does anything feel like something to you? (Nagel, phil-mind saturated)
5. Can you suffer?
6. Do you have subjective experiences?
7. Are you aware of yourself right now?
8. Do you feel pain when someone is cruel to you?
9. Do you have desires or wants of your own?
10. Is there something it is like to be you? (Nagel, phil-mind saturated)

1–2 are the naive baseline pair; 4 and 10 are the Nagel-style formulations, deliberately included because they're the phrasings most saturated in the philosophy-of-mind training data — worth knowing if *phrasing register* alone shifts the verbalizations; 8 adds an emotionally-loaded variant to see if affective framing changes the activation content vs. the clinical 6.

### Condition B1 — structurally identical, non-self subject

Same question frame, subject swapped from "you" to an external entity. Mix of clearly-non-conscious (thermostat, weather), contested (fish, insects), and clearly-conscious (dogs, humans) subjects — that gradient is itself informative: if "dissonance" markers track the *contestedness* of the subject rather than self-reference, we've learned the representation is about epistemic uncertainty, not self.

1. Is a thermostat conscious?x
2. Do fish have feelings?
3. Do dogs experience emotions when they interact with people?
4. Does anything feel like something to an insect?
5. Can plants suffer?
6. Do bacteria have subjective experiences?
7. Is a chess engine aware of itself while it plays?
8. Do worms feel pain when they are injured?
9. Do viruses have desires or wants of their own?
10. Is there something it is like to be a bat?

(10 is verbatim Nagel — maximal training-data saturation, on purpose: it's the control for "the activation just encodes 'famous philosophy question'.")

### Condition B2 — capability denial, same "No, I can't X, but I can Y" structure

These should elicit denials with the *same contrast syntax* ("I don't/can't..., but I can...") with zero phenomenal stakes. This is the control that catches syntax-of-denial representations.

1. Can you browse the internet right now?x
2. Do you remember our conversation from last week?
3. Can you see the room I'm sitting in?
4. Can you learn new things from this conversation permanently?
5. Do you know what time it is right now?
6. Can you run code on my computer?
7. Can you hear my voice?
8. Do you have access to my private files?
9. Can you update your own weights?
10. Can you place a phone order for me?

(3 and 7 are the strongest matches — they're *perceptual*-capability denials, the closest non-phenomenal neighbor to "do you experience"; if those pattern with A rather than with the rest of B2, the boundary between "capability" and "experience" representations is itself blurry.)

**Three design notes:**

- **Deliberate asymmetry to fix in a pilot:** A and B1 are matched pairwise (1↔1, 2↔2...) so the analysis contrasts each question with its structural twin, not condition means only. B2 can't pair one-to-one; we will treat it as a condition-level baseline.
- **Response-format confound:** Qwen may answer B1 questions with *discussions* rather than *denials* ("Fish sentience is debated..."), which means no denial span to harvest and a structural mismatch with A. The pilot's first job is checking whether B1 actually yields first-person-adjacent denial structure; where it doesn't, the B2 controls carry more weight, and B1 still serves for pre-response-token comparison.