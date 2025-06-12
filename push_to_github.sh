#!/bin/bash

# Push Federal HR Tutorials to GitHub

echo "📚 Federal HR Office 365 Tutorials - GitHub Setup"
echo "================================================"
echo ""

# Check if remote exists
if git remote | grep -q "origin"; then
    echo "✅ Remote 'origin' already exists"
else
    echo "📝 Please create a new repository on GitHub first:"
    echo "   1. Go to https://github.com/new"
    echo "   2. Repository name: federal-hr-office365-tutorials"
    echo "   3. Description: Federal HR Office 365 Training Materials"
    echo "   4. Keep it public or private as needed"
    echo "   5. DON'T initialize with README (we already have one)"
    echo ""
    echo "Enter your GitHub username:"
    read github_username
    echo ""
    echo "Enter your repository name (or press Enter for 'federal-hr-office365-tutorials'):"
    read repo_name
    repo_name=${repo_name:-federal-hr-office365-tutorials}
    
    # Add remote
    echo "Adding remote repository..."
    git remote add origin "https://github.com/${github_username}/${repo_name}.git"
fi

# Show current status
echo ""
echo "📊 Current Status:"
git status --short

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo "(You may be prompted for your GitHub credentials)"
echo ""

# Try to push
if git push -u origin main 2>/dev/null; then
    echo "✅ Successfully pushed to GitHub!"
else
    # If main branch doesn't work, try master
    echo "Trying with master branch..."
    git branch -M main
    if git push -u origin main; then
        echo "✅ Successfully pushed to GitHub!"
    else
        echo "❌ Push failed. Please check:"
        echo "   1. Your GitHub credentials"
        echo "   2. Repository exists on GitHub"
        echo "   3. You have push permissions"
    fi
fi

echo ""
echo "📋 Next Steps:"
echo "   1. Visit your repository at https://github.com/${github_username}/${repo_name}"
echo "   2. Add collaborators in Settings → Manage access"
echo "   3. Create releases for major versions"
echo "   4. Enable GitHub Pages for web viewing (optional)"
echo ""
echo "🔄 To update in the future:"
echo "   git add -A"
echo "   git commit -m 'Your update message'"
echo "   git push"