#!/bin/bash
set -euo pipefail

# Test build locally without publishing
# This demonstrates the script-first approach - you can run the exact same build process locally

echo "🧪 Testing local build process..."
echo ""

# Test version extraction
echo "1️⃣  Testing version extraction:"
./scripts/extract-version.sh v1.0.0
echo ""

# Test client build
echo "2️⃣  Testing client build:"
./scripts/build-client.sh
echo ""

# Test server build  
echo "3️⃣  Testing server build:"
./scripts/build-server.sh
echo ""

# Test publish preparation (dry run)
echo "4️⃣  Testing publish preparation (dry run):"
DRY_RUN=true ./scripts/publish-client.sh 1.0.0
echo ""

echo "🎉 All local tests passed!"
echo ""
echo "Available commands:"
echo "  ./scripts/clean.sh                   # Clean all build artifacts"
echo "  ./scripts/build-client.sh            # Build TypeScript client"
echo "  ./scripts/build-server.sh            # Build reference server"
echo "  ./scripts/test-local.sh              # Test complete workflow"
echo "  ./scripts/fix-lockfiles.sh           # Fix package-lock.json sync issues"
echo ""
echo "To actually publish:"
echo "  1. Create a git tag: git tag v1.0.0 && git push origin v1.0.0"
echo "  2. Create a GitHub release (this will trigger automatic publishing)"
echo "  3. Or publish manually: ./scripts/publish-client.sh 1.0.0"
echo ""
echo "Troubleshooting:"
echo "  If you see lock file sync errors, run: ./scripts/fix-lockfiles.sh"
echo "  If 'act' fails with auth errors, ignore it - use these scripts instead!"
