# /maniac - Intelligent Deep Testing Agent v5.1

```
███╗   ███╗ █████╗ ███╗   ██╗██╗ █████╗  ██████╗
████╗ ████║██╔══██╗████╗  ██║██║██╔══██╗██╔════╝
██╔████╔██║███████║██╔██╗ ██║██║███████║██║
██║╚██╔╝██║██╔══██║██║╚██╗██║██║██╔══██║██║
██║ ╚═╝ ██║██║  ██║██║ ╚████║██║██║  ██║╚██████╗
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝

    I N T E L L I G E N T   D E E P   T E S T I N G
```

**"Screenshots prove nothing. RESULTS prove everything."**

---

## Usage

```bash
/maniac <project|url> [options]

Options:
  --mode <mode>         Testing mode (see below)
  --fix                 Auto-fix bugs found
  --resume              Resume from checkpoint
  --story <id>          Test specific user story
  --start-url <path>    Start from specific page
```

---

## MODES

| Mode | Description | Focus | Duration |
|------|-------------|-------|----------|
| **`full`** | Complete intelligent testing | Everything | 4-12h |
| **`stories`** | User story validation | Business logic | 2-6h |
| **`integration`** | Frontend ↔ Backend testing | Connections | 2-4h |
| **`security`** | Security testing | XSS, SQLi, CSRF | 2-4h |
| **`ux`** | UX/UI audit | Design & usability | 1-3h |
| **`api`** | API endpoint testing | Backend | 1-3h |
| **`chaos`** | Chaos engineering | Edge cases | 1-2h |
| **`responsive`** | Responsive design | 9 breakpoints | 1-2h |
| **`a11y`** | Accessibility audit | WCAG compliance | 1-2h |
| **`performance`** | Performance testing | Load times | 1-2h |

---

## WHAT MANIAC v5.1 DOES

### Phase 0: User Story Discovery (NEW!)
- Scans README, docs, PRD for user stories
- Analyzes code for routes and features
- Discovers UI interactions at runtime
- Generates comprehensive test plan

**Output:** Complete list of ALL user stories

### Phase 1: Multi-Layer Validation
For EVERY test, validates:
- **Frontend:** UI state, console, visual
- **Network:** API calls, status codes, responses
- **Backend:** Server logs, function calls
- **Database:** Data state, records

**Output:** Full-stack test results (not just screenshots)

### Phase 2: Interaction Testing
- Tests every element combination
- Deep modal/popup testing
- CRUD sequences
- Form validations
- Chaos scenarios

**Output:** Complete interaction coverage

### Phase 3: Auto-Fix (if --fix)
- Analyzes bug root cause
- Generates fix
- Applies and validates
- Checks for regressions

**Output:** Bugs fixed automatically

---

## Examples

```bash
# 🔥 Complete intelligent testing (RECOMMENDED)
/maniac myproject --mode full --fix

# Validate all user stories
/maniac myproject --mode stories

# Test frontend ↔ backend connections
/maniac myproject --mode integration

# Test specific user story
/maniac myproject --story "US-001"

# Resume after interruption
/maniac myproject --resume

# Direct URL
/maniac https://myapp.com --mode full
```

---

## VALIDATION LAYERS

| Layer | What's Checked |
|-------|----------------|
| **Frontend** | UI state, console errors, accessibility |
| **Network** | API calls, status codes, response data |
| **Backend** | Server logs, errors, function execution |
| **Database** | Records created/updated/deleted |

---

## VERDICT

| Condition | Verdict |
|-----------|---------|
| CRITICAL bugs > 0 | 🚨 **NO-GO** |
| HIGH bugs > 0 | 🚨 **NO-GO** |
| User story failures > 10% | ⚠️ **CONDITIONAL** |
| All stories pass | ✅ **GO** |

---

## OUTPUT

Working directory: `/tmp/maniac-{project}-{timestamp}/`

```
maniac-myproject-20260130/
├── discovery/
│   ├── user-stories.json      # All discovered stories
│   ├── routes.json            # All discovered routes
│   └── interactions.json      # All discovered elements
├── tests/
│   ├── US-001/                # Test results per story
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
│   ├── BUG-001.md
│   └── ...
├── fixes/
│   └── applied-fixes.json
└── reports/
    └── MANIAC-REPORT.md
```

---

$ARGUMENTS

**MODE MANIAC v5.1 ACTIVÉ.**

Read the full agent spec at `~/.claude/agents/maniac.md` for complete protocols.

Execute the intelligent testing workflow:

1. **DISCOVER** - Find ALL user stories from docs, code, and UI
2. **PLAN** - Generate comprehensive test scenarios
3. **EXECUTE** - Test with multi-layer validation
4. **VALIDATE** - Check frontend, API, backend, database
5. **REPORT** - Generate actionable report with evidence
6. **FIX** - Auto-fix bugs if --fix enabled

---

## PROGRESS REPORTING

```
---MANIAC_STATUS---
VERSION: 5.1
PHASE: TESTING
MODE: stories
PROGRESS: 67% (32/47 stories)
TESTS: 847/1247 executed
PASSED: 812 (95.8%)
FAILED: 35
VALIDATIONS:
  Frontend: ✅ 847
  Network: ✅ 312 | ❌ 4
  Backend: ✅ 298 | ❌ 2
  Database: ✅ 156
DURATION: 2h 14m
NEXT: Testing US-033 "Export data to CSV"
---END_MANIAC_STATUS---
```

---

## MANTRAS

```
"I don't just click and screenshot. I understand, execute, and validate."
"Every user story I discover is a user journey I must protect."
"Frontend, API, backend, database - I validate ALL layers."
```
