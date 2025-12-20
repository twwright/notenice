#!/bin/bash

# Vercel Database Migration Script
# This script helps you run database migrations for your Vercel deployment

set -e

echo "🚀 NoteNice Vercel Migration Script"
echo "===================================="
echo ""

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI is not installed."
    echo "   Install it with: npm i -g vercel"
    exit 1
fi

echo "✅ Vercel CLI found"
echo ""

# Check if we're in the right directory
if [ ! -f "config.ru" ]; then
    echo "❌ Error: config.ru not found. Are you in the project root?"
    exit 1
fi

echo "✅ Project root detected"
echo ""

# Check if project is linked
if [ ! -d ".vercel" ]; then
    echo "⚠️  Project not linked to Vercel."
    echo "   Running: vercel link"
    vercel link
    echo ""
fi

echo "✅ Project linked to Vercel"
echo ""

# Pull environment variables
echo "📥 Pulling environment variables from Vercel..."
vercel env pull .env.production
echo "✅ Environment variables downloaded"
echo ""

# Check if bundle is installed
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler is not installed."
    echo "   Install it with: gem install bundler"
    exit 1
fi

# Install dependencies if needed
if [ ! -d "vendor/bundle" ] && [ ! -d ".bundle" ]; then
    echo "📦 Installing dependencies..."
    bundle install
    echo ""
fi

# Run migrations
echo "🔄 Running database migrations..."
echo ""

# Load environment variables and run migrations
if [ -f ".env.production" ]; then
    export $(cat .env.production | grep -v '^#' | xargs)
fi

RACK_ENV=production bundle exec rake db:migrate

echo ""
echo "✅ Migrations completed successfully!"
echo ""
echo "📝 Next steps:"
echo "   1. Verify your database at your provider's dashboard"
echo "   2. Test your Vercel deployment"
echo "   3. Check logs with: vercel logs [deployment-url]"
echo ""
echo "🎉 Done!"

