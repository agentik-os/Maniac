#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
# MANIAC v5.1 - Installation Script
# Intelligent Deep Testing Agent for Claude Code
# ═══════════════════════════════════════════════════════════════════════════════

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color
BOLD='\033[1m'
DIM='\033[2m'

# Configuration
CLAUDE_DIR="$HOME/.claude"
REPO_URL="https://raw.githubusercontent.com/agentik-os/maniac/main"

# ═══════════════════════════════════════════════════════════════════════════════
# Helper Functions
# ═══════════════════════════════════════════════════════════════════════════════

print_banner() {
    echo ""
    echo -e "${MAGENTA}"
    echo "███╗   ███╗ █████╗ ███╗   ██╗██╗ █████╗  ██████╗"
    echo "████╗ ████║██╔══██╗████╗  ██║██║██╔══██╗██╔════╝"
    echo "██╔████╔██║███████║██╔██╗ ██║██║███████║██║     "
    echo "██║╚██╔╝██║██╔══██║██║╚██╗██║██║██╔══██║██║     "
    echo "██║ ╚═╝ ██║██║  ██║██║ ╚████║██║██║  ██║╚██████╗"
    echo "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝"
    echo -e "${NC}"
    echo -e "${BOLD}MANIAC v5.1 - Intelligent Deep Testing Agent${NC}"
    echo -e "${YELLOW}\"Screenshots prove nothing. RESULTS prove everything.\"${NC}"
    echo ""
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# ═══════════════════════════════════════════════════════════════════════════════
# Environment Detection
# ═══════════════════════════════════════════════════════════════════════════════

detect_environment() {
    echo ""
    echo -e "${BOLD}🔍 Detecting Environment...${NC}"
    echo ""

    # Check Claude Code
    if command -v claude &> /dev/null; then
        log_success "Claude Code detected"
        CLAUDE_INSTALLED=true
    else
        log_warning "Claude Code not found - install from claude.ai/code"
        CLAUDE_INSTALLED=false
    fi

    # Check existing Claude Code setup
    echo ""
    echo -e "${BOLD}🛠️ Existing Claude Code Setup:${NC}"

    if [ -d "$CLAUDE_DIR" ]; then
        log_success "~/.claude/ directory exists"

        # Check for existing agents
        if [ -d "$CLAUDE_DIR/agents" ]; then
            AGENT_COUNT=$(ls -1 "$CLAUDE_DIR/agents"/*.md 2>/dev/null | wc -l || echo "0")
            log_info "Found $AGENT_COUNT agent(s) in ~/.claude/agents/"
        fi

        # Check for existing commands
        if [ -d "$CLAUDE_DIR/commands" ]; then
            CMD_COUNT=$(ls -1 "$CLAUDE_DIR/commands"/*.md 2>/dev/null | wc -l || echo "0")
            log_info "Found $CMD_COUNT command(s) in ~/.claude/commands/"
        fi

        # Check if MANIAC already exists
        if [ -f "$CLAUDE_DIR/agents/maniac.md" ] || [ -f "$CLAUDE_DIR/commands/maniac.md" ]; then
            log_warning "MANIAC already installed - will upgrade"
            MANIAC_UPGRADE=true
        fi
    else
        log_warning "~/.claude/ not found - will create"
    fi

    # Check for browser testing tools
    echo ""
    echo -e "${BOLD}🌐 Browser Testing Tools:${NC}"

    if command -v playwright &> /dev/null; then
        log_success "Playwright detected"
    else
        log_info "Playwright not found (optional - MANIAC uses MCP tools)"
    fi

    echo ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# Installation
# ═══════════════════════════════════════════════════════════════════════════════

create_directories() {
    log_info "Creating directories..."

    mkdir -p "$CLAUDE_DIR/agents"
    mkdir -p "$CLAUDE_DIR/commands"

    log_success "Directories created"
}

download_file() {
    local url="$1"
    local dest="$2"

    if command -v curl &> /dev/null; then
        curl -fsSL "$url" -o "$dest" 2>/dev/null
    elif command -v wget &> /dev/null; then
        wget -q "$url" -O "$dest" 2>/dev/null
    else
        log_error "Neither curl nor wget found. Please install one."
        exit 1
    fi
}

install_maniac() {
    log_info "Installing MANIAC v5.1..."
    echo ""

    # Download agent definition
    log_info "Downloading agent definition..."
    download_file "$REPO_URL/agents/maniac.md" "$CLAUDE_DIR/agents/maniac.md"
    log_success "Agent installed: ~/.claude/agents/maniac.md"

    # Download command definition
    log_info "Downloading command definition..."
    download_file "$REPO_URL/commands/maniac.md" "$CLAUDE_DIR/commands/maniac.md"
    log_success "Command installed: ~/.claude/commands/maniac.md"

    echo ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# Post-Installation Summary
# ═══════════════════════════════════════════════════════════════════════════════

print_summary() {
    echo ""
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}  ✅ MANIAC v5.1 INSTALLED SUCCESSFULLY${NC}"
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo ""

    echo -e "${BOLD}📁 Files Installed:${NC}"
    echo "   ~/.claude/agents/maniac.md"
    echo "   ~/.claude/commands/maniac.md"
    echo ""

    echo -e "${BOLD}🚀 Usage:${NC}"
    echo ""
    echo "   1. Start Claude Code:"
    echo -e "      ${CYAN}claude${NC}"
    echo ""
    echo "   2. Run MANIAC:"
    echo -e "      ${CYAN}/maniac <project> --mode full${NC}"
    echo ""

    echo -e "${BOLD}📋 Available Modes:${NC}"
    echo ""
    echo "   ${CYAN}--mode full${NC}        Complete intelligent testing"
    echo "   ${CYAN}--mode stories${NC}     User story validation"
    echo "   ${CYAN}--mode integration${NC} Frontend ↔ Backend testing"
    echo "   ${CYAN}--mode security${NC}    Security testing (XSS, SQLi)"
    echo "   ${CYAN}--mode ux${NC}          UX/UI audit"
    echo "   ${CYAN}--mode api${NC}         API endpoint testing"
    echo "   ${CYAN}--mode chaos${NC}       Chaos engineering"
    echo "   ${CYAN}--mode responsive${NC}  Responsive design (9 breakpoints)"
    echo "   ${CYAN}--mode a11y${NC}        Accessibility audit"
    echo "   ${CYAN}--mode performance${NC} Performance testing"
    echo ""

    echo -e "${BOLD}💡 Quick Examples:${NC}"
    echo ""
    echo "   # Full testing with auto-fix"
    echo -e "   ${CYAN}/maniac myproject --mode full --fix${NC}"
    echo ""
    echo "   # Validate user stories"
    echo -e "   ${CYAN}/maniac myproject --mode stories${NC}"
    echo ""
    echo "   # Test specific user story"
    echo -e "   ${CYAN}/maniac myproject --story \"US-001\"${NC}"
    echo ""

    echo -e "${BOLD}🔥 What's New in v5.1:${NC}"
    echo ""
    echo "   • Auto-discovers user stories from docs, code, and UI"
    echo "   • Multi-layer validation (Frontend + API + Backend + Database)"
    echo "   • Deep interaction testing"
    echo "   • Intelligent auto-fix capabilities"
    echo "   • Comprehensive reporting with evidence"
    echo ""

    echo -e "${YELLOW}💡 Tip: MANIAC validates RESULTS, not just screenshots!${NC}"
    echo ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# Main
# ═══════════════════════════════════════════════════════════════════════════════

main() {
    print_banner
    detect_environment

    echo -e "${BOLD}Ready to install MANIAC v5.1?${NC}"
    echo ""
    read -p "Press Enter to continue or Ctrl+C to cancel..."
    echo ""

    create_directories
    install_maniac
    print_summary
}

# Run main function
main "$@"
