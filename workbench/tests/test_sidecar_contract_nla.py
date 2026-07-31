    from transformers import AutoTokenizer
    from nla.schema import compute_canonical_neighbors
    import yaml, os

    snap = os.environ["SNAP"]
    tok = AutoTokenizer.from_pretrained(snap)
    meta = yaml.safe_load(open(f"{snap}/nla_meta.yaml"))

    t = meta["tokens"]
    left, right = compute_canonical_neighbors(
        tok,
        meta["prompt_templates"].get("av") or meta["prompt_templates"]["actor"],
        t["injection_char"],
        t["injection_token_id"],
    )
    print(left, right)                      # expect 29 522
    assert (left, right) == (t["injection_left_neighbor_id"],
                             t["injection_right_neighbor_id"])
    print("✓ matches sidecar")