<p align="center">
  <img src="https://img.shields.io/badge/version-5.1-purple?style=flat-square" alt="Version"/>
  <img src="https://img.shields.io/badge/license-Proprietary-red?style=flat-square" alt="License"/>
  <img src="https://img.shields.io/badge/claude--code-compatible-green?style=flat-square" alt="Claude Code"/>
  <a href="#support"><img src="https://img.shields.io/badge/sponsor-support%20MANIAC-ff69b4?style=flat-square" alt="Support"/></a>
</p>

<p align="center">
  <pre align="center">
███╗   ███╗ █████╗ ███╗   ██╗██╗ █████╗  ██████╗
████╗ ████║██╔══██╗████╗  ██║██║██╔══██╗██╔════╝
██╔████╔██║███████║██╔██╗ ██║██║███████║██║
██║╚██╔╝██║██╔══██║██║╚██╗██║██║██╔══██║██║
██║ ╚═╝ ██║██║  ██║██║ ╚████║██║██║  ██║╚██████╗
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝
  </pre>
</p>

<h3 align="center">Intelligent Deep Testing Agent for Claude Code</h3>
<p align="center"><em>"Screenshots prove nothing. RESULTS prove everything."</em></p>

---

> **⚠️ License Notice:** This software is proprietary. Personal use is permitted. Public forks, redistribution, and commercial use require written permission. See [LICENSE](LICENSE).

---

**MANIAC** is an autonomous testing agent for [Claude Code](https://claude.ai/code). Unlike traditional testing tools that just click and screenshot, MANIAC:

- **Discovers** all user stories automatically from your docs, code, and UI
- **Validates** results across all layers (frontend, API, backend, database)
- **Analyzes** logs and connections to find root causes
- **Fixes** bugs automatically when issues are found

---

## Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Quick Start](#quick-start)
4. [Testing Modes](#testing-modes)
5. [How It Works](#how-it-works)
6. [What Makes v5.1 Different](#what-makes-v51-different)
7. [Output & Reports](#output--reports)
8. [FAQ](#faq)
9. [Support](#support)

---

## Requirements

| Requirement | How to get it |
|-------------|---------------|
| **Claude Code** | Install from [claude.ai/code](https://claude.ai/code) |
| **Node.js 18+** | `curl -fsSL https://bun.sh/install \| bash` |

### Optional (Recommended)

| Tool | Purpose |
|------|---------|
| **Playwright MCP** | Browser automation |
| **Chrome DevTools MCP** | Deep browser inspection |

---

## Installation

### Quick Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/agentik-os/maniac/main/install.sh | bash
```

### Manual Install

```bash
git clone https://github.com/agentik-os/maniac.git
cd maniac
chmod +x install.sh
./install.sh
```

### Verify Installation

```bash
claude
# Inside Claude Code:
/maniac --help
```

---

## Quick Start

### Basic Usage

```bash
# Start Claude Code in your project
cd my-project
claude

# Run full testing
/maniac . --mode full

# With auto-fix
/maniac . --mode full --fix
```

### Test by URL

```bash
/maniac https://myapp.com --mode full
```

### Test Specific User Story

```bash
/maniac . --story "US-001"
```

---

## Testing Modes

| Mode | Description | Best For | Duration |
|------|-------------|----------|----------|
| **`full`** | Complete intelligent testing | Pre-release | 4-12h |
| **`stories`** | User story validation | Feature validation | 2-6h |
| **`integration`** | Frontend ↔ Backend | API changes | 2-4h |
| **`security`** | XSS, SQLi, CSRF testing | Security audit | 2-4h |
| **`ux`** | UX/UI audit | Design review | 1-3h |
| **`api`** | API endpoint testing | Backend changes | 1-3h |
| **`chaos`** | Edge cases & chaos | Stress testing | 1-2h |
| **`responsive`** | 9 viewport sizes | UI changes | 1-2h |
| **`a11y`** | Accessibility audit | Compliance | 1-2h |
| **`performance`** | Load times & memory | Optimization | 1-2h |

### Examples

```bash
# Complete testing (recommended before release)
/maniac myproject --mode full --fix

# Validate all user stories
/maniac myproject --mode stories

# Test frontend ↔ backend connections
/maniac myproject --mode integration

# Security audit
/maniac myproject --mode security

# After UI changes
/maniac myproject --mode responsive
```

---

## How It Works

### Phase 0: User Story Discovery

MANIAC automatically discovers ALL user stories from:

1. **Documentation** - README, PRD, FEATURES.md, USER-STORIES.md
2. **Code Analysis** - Routes, components, API endpoints, database schemas
3. **UI Analysis** - Interactive elements, forms, buttons, links

```
Output: "Discovered 47 user stories from 3 sources"
```

### Phase 1: Test Planning

For each user story, MANIAC generates:
- Test steps
- Expected outcomes
- Validation rules (frontend, API, backend, database)

### Phase 2: Multi-Layer Validation

For EVERY action, MANIAC validates:

| Layer | What's Checked |
|-------|----------------|
| **Frontend** | UI state changed, no console errors, accessibility |
| **Network** | Correct API called, status code, response data |
| **Backend** | No server errors, function executed correctly |
| **Database** | Record created/updated/deleted correctly |

### Phase 3: Intelligent Reporting

```markdown
## Test: US-001 Create Patient

✅ Step 1: Click "New Patient" → Modal opened
✅ Step 2: Fill form → All fields populated
✅ Step 3: Submit → API returned 201, modal closed
✅ Step 4: Verify → Patient appears in list, database record exists

RESULT: PASSED (4/4 validations)
```

### Phase 4: Auto-Fix (if --fix)

When a bug is found:
1. Analyze root cause
2. Generate fix
3. Apply fix
4. Rebuild
5. Re-test
6. Check for regressions
7. Document fix

---

## What Makes v5.1 Different

### v4.x (Screenshot Mode)
```
"I clicked 'Create Patient' button"
"I took a screenshot"
"Moving to next element..."
```

**Problem:** Screenshots prove you clicked. They don't prove anything works.

### v5.1 (Result Verification)
```
"I clicked 'Create Patient' button"
"Modal opened ✓"
"Filled form with test data"
"Submitted form"
"API returned 201 Created ✓"
"Modal closed ✓"
"Patient 'Test Patient' appears in list ✓"
"Database record exists with correct data ✓"
"RESULT: Feature works correctly"
```

**Solution:** MANIAC validates that features actually WORK, not just that buttons exist.

---

## Output & Reports

### Working Directory

```
/tmp/maniac-myproject-20260130/
├── discovery/
│   ├── user-stories.json      # All discovered stories
│   ├── routes.json            # All discovered routes
│   └── interactions.json      # All discovered elements
├── tests/
│   ├── US-001/                # Results per story
│   ├── US-002/
│   └── ...
├── validations/
│   ├── frontend.json
│   ├── network.json
│   ├── backend.json
│   └── database.json
├── evidence/
│   ├── screenshots/
│   ├── network-logs/
│   └── backend-logs/
├── bugs/
│   └── BUG-001.md
├── fixes/
│   └── applied-fixes.json
└── reports/
    └── MANIAC-REPORT.md
```

### Final Report

```markdown
# MANIAC v5.1 Test Report

## Summary
| Metric | Value |
|--------|-------|
| User Stories | 47 discovered, 47 tested (100%) |
| Tests Executed | 1,247 |
| Pass Rate | 94.3% |
| **Verdict** | ⚠️ CONDITIONAL |

## Failed Tests
- US-003: Payment processing (API timeout)
- US-017: Export feature (missing button)

## Recommendations
1. BLOCKER: Fix payment API before release
2. HIGH: Add loading states to forms
```

---

## FAQ

### Q: How long does a full test take?

Depends on your app size. Typical ranges:
- Small app (10-20 pages): 2-4 hours
- Medium app (50+ pages): 4-8 hours
- Large app (100+ pages): 8-12+ hours

MANIAC is thorough. Let it run.

### Q: Can I test a specific feature?

Yes:
```bash
/maniac myproject --story "US-001"
/maniac myproject --start-url /dashboard
```

### Q: What if MANIAC crashes?

Resume from checkpoint:
```bash
/maniac myproject --resume
```

### Q: Does MANIAC modify my code?

Only with `--fix` flag. All changes are:
- Validated with build
- Tested for regressions
- Documented in fixes/

### Q: What browsers does MANIAC support?

MANIAC uses Claude Code's MCP tools (Playwright, Chrome DevTools). Works with Chromium-based browsers.

---

## Support

If MANIAC saves you from production bugs, consider supporting its development.

<p align="center">
  <a href="https://paypal.me/garethsimono">
    <img src="https://img.shields.io/badge/PayPal-Donate-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal"/>
  </a>
</p>

<p align="center">
  <sub><strong>PayPal:</strong> simono.gareth@gmail.com</sub>
</p>

<br/>

<table align="center">
  <tr>
    <th>Crypto</th>
    <th>Network</th>
    <th>Address</th>
  </tr>
  <tr>
    <td><strong>USDT</strong></td>
    <td>Arbitrum</td>
    <td><code>0x8709fd7475780d4caa2c6674b06396c57a0530fa</code></td>
  </tr>
  <tr>
    <td><strong>SOL</strong></td>
    <td>Solana</td>
    <td><code>37H9ecXZ2BpWkBEogCcosj6LEBp5uqgBs5fjJgjzNeo7</code></td>
  </tr>
  <tr>
    <td><strong>BTC</strong></td>
    <td>Bitcoin</td>
    <td><code>1CVMhkWDBMt5C5WsE8vmY84KSnFCrgPbZL</code></td>
  </tr>
</table>

<br/>

<p align="center">
  <sub>Your support keeps MANIAC hunting bugs. Thank you! 🔥</sub>
</p>

---

## Links

- [Claude Code](https://claude.ai/code) - The AI coding assistant
- [FORGE](https://github.com/agentik-os/forge) - Project creation companion
- [Agentik OS on TAAFT](https://theresanaiforthat.com/@agentik_os/) - More AI tools

---

## License

**Proprietary License** - see [LICENSE](LICENSE)

| Permitted | Not Permitted |
|-----------|---------------|
| ✅ View and study source code | ❌ Public forks or redistribution |
| ✅ Personal, non-commercial use | ❌ Commercial use without permission |
| ✅ Private modifications | ❌ Sublicensing |

**Commercial licensing:** x@agentik-os.com

---

## Credits

- Built for [Claude Code](https://claude.ai/code) by Anthropic
- Created by [Agentik OS](https://github.com/agentik-os)

---

<p align="center">
  <strong>"Screenshots prove nothing. RESULTS prove everything."</strong>
</p>
