#!/bin/bash

# Local Deployment Testing Script
# Tests deployment configuration without requiring npm/node

echo "🧪 NapRoute Local Deployment Testing"
echo "===================================="
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

success() { echo -e "${GREEN}✅ $1${NC}"; }
error() { echo -e "${RED}❌ $1${NC}"; }
warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
info() { echo -e "${BLUE}ℹ️  $1${NC}"; }

echo "1. 📁 Checking deployment files..."
echo "--------------------------------"

# Check required files
files=(
    "package.json"
    "vite.config.js" 
    "netlify.toml"
    "vercel.json"
    ".env.production"
    ".github/workflows/deploy.yml"
    "lighthouserc.js"
    "DEPLOYMENT.md"
    "scripts/deploy.sh"
    "scripts/validate-production.js"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        success "Found: $file"
    else
        error "Missing: $file"
    fi
done

echo ""
echo "2. 🔧 Checking configuration files..."
echo "-----------------------------------"

# Check netlify.toml
if [ -f "netlify.toml" ]; then
    if grep -q "Content-Security-Policy" netlify.toml; then
        success "Netlify: Security headers configured"
    else
        warning "Netlify: Security headers not found"
    fi
    
    if grep -q "npm run build" netlify.toml; then
        success "Netlify: Build command configured"
    else
        error "Netlify: Build command not configured"
    fi
fi

# Check vercel.json
if [ -f "vercel.json" ]; then
    if grep -q "X-Frame-Options" vercel.json; then
        success "Vercel: Security headers configured"
    else
        warning "Vercel: Security headers not found"
    fi
fi

# Check package.json scripts
if [ -f "package.json" ]; then
    if grep -q "build:production" package.json; then
        success "Package.json: Production build script found"
    else
        error "Package.json: Production build script missing"
    fi
    
    if grep -q "validate:production" package.json; then
        success "Package.json: Validation script found"
    else
        warning "Package.json: Validation script missing"
    fi
fi

echo ""
echo "3. 🔒 Checking security configuration..."
echo "--------------------------------------"

# Check .env files
if [ -f ".env.production" ]; then
    success "Production environment file exists"
    if grep -q "VITE_GOOGLE_MAPS_API_KEY" .env.production; then
        success "Production: Google Maps API key placeholder found"
    else
        error "Production: Google Maps API key not configured"
    fi
else
    error "Production environment file missing"
fi

if [ -f ".env.example" ]; then
    success "Example environment file exists"
else
    warning "Example environment file missing"
fi

# Check security utility
if [ -f "src/utils/security.js" ]; then
    success "Security utility exists"
    if grep -q "enforceHTTPS" src/utils/security.js; then
        success "HTTPS enforcement configured"
    else
        warning "HTTPS enforcement not found"
    fi
else
    error "Security utility missing"
fi

echo ""
echo "4. 🚀 Manual testing instructions..."
echo "----------------------------------"

info "To test the deployment setup:"
echo ""
echo "📱 Open test-local-deployment.html in your browser"
echo "   → Interactive testing interface"
echo ""
echo "🔨 Build and preview locally:"
echo "   npm install          # Install dependencies"
echo "   npm run build        # Build for production"
echo "   npm run preview      # Preview production build"
echo ""
echo "✅ Validate production readiness:"
echo "   npm run validate:production"
echo ""
echo "🧪 Run all tests:"
echo "   npm run test:all"
echo ""
echo "⚡ Performance audit:"
echo "   npm run lighthouse  # Requires preview server running"
echo ""
echo "🚀 Deploy (after setup):"
echo "   ./scripts/deploy.sh netlify   # or vercel"
echo ""

echo ""
echo "5. 📋 Pre-deployment checklist..."
echo "--------------------------------"

warning "Before deploying to production:"
echo "  □ Set up Google Maps API key with restrictions"
echo "  □ Configure deployment platform (Netlify/Vercel)"
echo "  □ Set environment variables in deployment platform"
echo "  □ Configure custom domain (optional)"
echo "  □ Test all functionality locally"
echo "  □ Run performance audit"
echo "  □ Review security settings"
echo ""

success "Local deployment testing complete!"
info "Open test-local-deployment.html for interactive testing"