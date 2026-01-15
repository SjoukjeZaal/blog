---
title: "My Personal Digital Archive — by Design"
date: 2026-01-13
---

Over the years, my work spread across many platforms. Blog posts, articles, talks, technical notes, experiments. Some published under company banners, some on personal sites, some simply gone.

That fragmentation started to bother me. Not emotionally — architecturally.

Platforms change. Companies rebrand. Services shut down. Links decay. If your work depends on someone else’s platform, it is fragile by default.

So I chose a different approach.

This site is not “another blog”.  
It is my personal digital archive, intentionally built to remain accessible beyond platforms, trends, and tooling choices.

---

## Why static

Everything here is static. Plain text. Markdown. Generated with Hugo.  
No database. No backend. No runtime dependencies.

That choice is deliberate.

Static content is boring in exactly the right way. It can be copied, rebuilt, validated, and moved without friction. It survives because it assumes very little.

If I can recreate this site from a folder of markdown files, I am not locked in.

---

## IPFS as a distribution layer, not a promise

The archive is published on IPFS and addressed by content rather than location. That makes the content verifiable: what you read is exactly what was published.

But IPFS is not permanent storage.  
It does not guarantee availability. It guarantees addressability.

Long-term availability comes from operations. This site is hosted via 4EVERLAND, which provides managed IPFS, IPNS, replication, and long-term pinning. That operational layer is what keeps the archive online over time.

The distinction matters.

---

## IPNS and continuity

Writing evolves. This archive is not frozen.

IPNS provides a stable reference that can be updated as new material is added, without breaking existing links. The reference stays constant while the content moves forward.

That balance — continuity without stagnation — was essential.

---

## ENS, ownership, and sovereignty

The archive is reachable via `sjoukje.eth`, registered through the Ethereum Name Service (ENS).

This is not about novelty. It is about sovereignty.

The name is not issued by a registrar, governed by platform terms, or subject to policy changes. Control sits at the protocol level. As long as the underlying chain exists, the name remains under my authority.

That matters. It means I decide where this archive lives, how it is served, and when it moves. Hosting providers can change. Gateways can shift. Infrastructure can evolve. The identity does not.

ENS turns naming into an architectural choice rather than a commercial dependency.

---

## Why it is also available via a regular domain

Decentralized infrastructure should not reduce reach.

This archive is also available through a traditional domain. Different access paths, identical content. The goal is accessibility, not ideology.

---

## This is not nostalgia

This archive is not about preserving the past for sentimental reasons.

It is about professional continuity. Architecture decisions, lessons learned, and patterns that repeat over time only compound if they remain accessible.

---

## The result

What you are reading is the outcome of that thinking:

- Static and portable  
- Distributed via IPFS  
- Updated through IPNS  
- Anchored to an ENS identity  
- Backed by long-term hosting  
- Rebuildable from plain text  

No dashboards.  
No feeds.  
No algorithms.

Just a record — designed to last.
