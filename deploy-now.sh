#!/bin/bash

echo "🚀 NapRoute Deployment Helper"
echo "=============================="
echo ""

echo "Your NapRoute app is ready to deploy!"
echo ""

echo "📁 Files ready for deployment:"
echo "  • dist/index.html (standalone app)"
echo "  • All source code committed to git"
echo ""

echo "🌐 Choose your deployment method:"
echo ""

echo "1️⃣  NETLIFY (Recommended - Easiest)"
echo "   • Go to: https://netlify.com"
echo "   • Sign up for free"
echo "   • Drag 'dist' folder to deploy area"
echo "   • Get instant live URL!"
echo ""

echo "2️⃣  VERCEL (Also great)"
echo "   • Go to: https://vercel.com"
echo "   • Sign up for free"
echo "   • Import from GitHub or upload files"
echo ""

echo "3️⃣  GITHUB PAGES (Free forever)"
echo "   • Create GitHub repository"
echo "   • Push this code"
echo "   • Enable Pages in repo settings"
echo ""

echo "4️⃣  SURGE.SH (Super quick)"
echo "   • npm install -g surge"
echo "   • cd dist && surge"
echo "   • Get instant domain!"
echo ""

echo "🔑 IMPORTANT: After deployment"
echo "   • Update Google Maps API key restrictions"
echo "   • Add your live domain to allowed referrers"
echo "   • Test on mobile devices"
echo ""

echo "📱 Your app will be accessible worldwide!"
echo "   Example: https://your-app-name.netlify.app"
echo ""

echo "🎉 Ready to make NapRoute live? Choose a method above!"

# Open deployment folders
echo "Opening deployment files..."
open dist
open .

echo ""
echo "✨ Happy deploying!"