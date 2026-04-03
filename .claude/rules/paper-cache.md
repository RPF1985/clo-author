# Paper Cache Protocol

Agents cache extracted paper text as structured markdown for reuse across sessions and after context compression. Two cache layers ensure both cross-project sharing and fast local reads.

---

## 1. Cache Layers

| Layer | Location | Key | Scope |
|-------|----------|-----|-------|
| **Global** | Path from CLAUDE.md "Paper Cache" section (default: `~/Zotero/paper_cache/`) | Zotero item key | Shared across all projects |
| **Project** | `data/paper_cache/` | BibTeX citekey | Single project, gitignored by default |

---

## 2. Cache Key Scheme

- **Zotero-sourced papers:** `{zotero_item_key}.md` (global), `{citekey}.md` (project)
  - The Zotero item key is the unique alphanumeric key from Zotero (e.g., `ABC12345`)
  - The citekey comes from BibTeX (e.g., `smith2024durability`)
- **Non-Zotero papers (no DOI, can't add to Zotero):** slugified `{firstauthor}_{year}_{first5words}.md` in both layers

---

## 3. Cache File Format

```markdown
---
zotero_key: ABC12345
citekey: smith2024durability
doi: 10.1234/example
title: "Full Paper Title"
authors: "Author A, Author B"
year: 2024
journal: "American Political Science Review"
source: zotero | webfetch | pdf_upload
cached_at: 2026-04-03T14:30:00Z
---

# Full Paper Title

## Abstract
[extracted abstract]

## 1. Introduction
[section text with original headings preserved where possible]

## 2. ...
[remaining sections]

---
*Cached from [source]. Headings may not match original exactly. See original PDF for authoritative text.*
```

### Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `zotero_key` | If available | Zotero item key (links to global cache) |
| `citekey` | Yes | BibTeX citation key |
| `doi` | If available | Digital Object Identifier |
| `title` | Yes | Full paper title |
| `authors` | Yes | Comma-separated author names |
| `year` | Yes | Publication year |
| `journal` | If available | Journal or venue name |
| `source` | Yes | How the text was obtained: `zotero`, `webfetch`, or `pdf_upload` |
| `cached_at` | Yes | ISO 8601 timestamp of cache creation |

---

## 4. Lookup Order

When an agent needs paper text:

1. Check `data/paper_cache/{citekey}.md` (project cache)
2. Check global cache `{global_path}/{zotero_key}.md` (read path from CLAUDE.md)
3. Extract from source:
   a. `zotero_get_item_fulltext` (if Zotero MCP configured)
   b. PDF in `master_supporting_docs/` (use Ghostscript chunking per content-standards.md Section 3)
   c. WebFetch from DOI/URL
4. On extraction: write to **both** global cache (by zotero_key) and project cache (by citekey)
5. First cache hit wins — do not re-extract if cached markdown exists

---

## 5. Agent Responsibilities

### Librarian (primary cache populator)
- After reading any paper's full text (from any source), immediately cache it to both layers
- Check cache before calling `zotero_get_item_fulltext` — a cache hit saves an MCP round-trip
- Cache writes count as incremental saves — do not batch

### All other agents (cache consumers)
- Check `data/paper_cache/` before fetching paper text from external sources
- Read selectively — use section headings to read only the relevant parts (e.g., just the methods section) rather than loading the entire cached file
- Do **not** write to the cache — only the librarian populates it

---

## 6. Invalidation

- **No automatic invalidation.** Cached files are regenerable from the original source.
- To force re-extraction, delete the cached `.md` file.
- Zotero annotations are **not cached** — they change frequently and should always be fetched live via `zotero_get_annotations`.
- If a cached file looks corrupted or garbled, fall back to the original PDF or Zotero full text.

---

## 7. Selective Reading

Cached markdown with preserved section headings enables surgical reads that save context:

| Agent Need | What to Read | Approximate Savings |
|------------|-------------|-------------------|
| Novelty check | Abstract + Introduction only | ~80% |
| Literature positioning | Introduction + Related Work | ~60% |
| Design reference | Methods/Design section only | ~70% |
| Data source leads | Data section only | ~80% |
| Full review | Entire file | 0% (but saves extraction time) |

Agents should read the section they need, not the whole file, unless a full read is required.
