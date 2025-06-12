#!/bin/bash

echo "📚 Creating organized branch structure for tutorials..."

# Excel branch
echo "📊 Creating Excel tutorials branch..."
git checkout -b feature/excel-tutorials
git add Excel_*.md
git commit -m "feat(excel): Add Excel tutorials for HR data analysis

- Excel HR Data Analysis Tutorial: Comprehensive guide for creating HR dashboards, 
  analyzing workforce metrics, and automating reports
- Excel Advanced HR Formulas: Master complex formulas including XLOOKUP, 
  date calculations, and statistical analysis for HR

Covers: pivot tables, dynamic charts, KPIs, tenure calculations, and more"

# Outlook branch  
echo "📧 Creating Outlook tutorials branch..."
git checkout main
git checkout -b feature/outlook-tutorials
git add Outlook_*.md
git commit -m "feat(outlook): Add Outlook email management tutorial

- Comprehensive guide for HR email organization
- Professional communication templates
- Rules and automation setup
- Quick Steps for efficiency
- Security and compliance best practices

Includes: folder structures, categories, search techniques, and Office 365 integration"

# SharePoint branch
echo "🏢 Creating SharePoint tutorials branch..."
git checkout main
git checkout -b feature/sharepoint-tutorials
git add SharePoint_*.md
git commit -m "feat(sharepoint): Add SharePoint collaboration tutorial

- Complete guide for building HR team sites
- Document library structures
- Lists for HR operations
- Power Automate workflows
- Security and permissions setup

Features: employee onboarding tracker, policy management, and HR dashboards"

# Teams branch
echo "💬 Creating Teams tutorials branch..."
git checkout main
git checkout -b feature/teams-tutorials  
git add Teams_*.md
git commit -m "feat(teams): Add Microsoft Teams collaboration guide

- Building HR team structure with channels
- Optimizing communications and meetings
- Apps integration for HR workflows
- Virtual interview best practices
- Analytics and reporting

Covers: channel organization, meeting management, and automation"

# PowerPoint branch
echo "🎨 Creating PowerPoint tutorials branch..."
git checkout main
git checkout -b feature/powerpoint-tutorials
git add PowerPoint_*.md
git commit -m "feat(powerpoint): Add PowerPoint presentation mastery guide

- HR presentation fundamentals
- Design templates and branding
- Data visualization techniques
- Animations and transitions
- Interactive elements

Includes: templates for orientation, metrics, and benefits presentations"

# Office 365 Integration branch
echo "🔗 Creating Office 365 integration tutorials branch..."
git checkout main
git checkout -b feature/office365-integration
git add Office365_*.md Customer_*.md
git commit -m "feat(office365): Add Office 365 integration and customer service guides

- Office 365 HR Complete Guide: Full platform integration strategies
- Customer Service Excellence: Transform HR interactions with service mindset

Covers: Power Platform, security, AI integration, and professional development"

# Documentation branch
echo "📝 Creating documentation branch..."
git checkout main
git checkout -b feature/documentation
git add README.md .gitignore *.sh maintenance_*.md onenote_*.md sharepoint_*.md
git commit -m "docs: Add comprehensive documentation and utilities

- README with tutorial overview and usage instructions
- Conversion scripts for multiple formats
- Maintenance workflows for different platforms
- Setup and deployment guides

Includes: git workflow, SharePoint setup, and OneNote strategies"

# Push all branches
echo ""
echo "🚀 Pushing all branches to GitHub..."
git push origin feature/excel-tutorials
git push origin feature/outlook-tutorials
git push origin feature/sharepoint-tutorials
git push origin feature/teams-tutorials
git push origin feature/powerpoint-tutorials
git push origin feature/office365-integration
git push origin feature/documentation

# Return to main
git checkout main

echo ""
echo "✅ Branch structure created successfully!"
echo ""
echo "📋 Branches created:"
echo "  - feature/excel-tutorials"
echo "  - feature/outlook-tutorials"
echo "  - feature/sharepoint-tutorials"
echo "  - feature/teams-tutorials"
echo "  - feature/powerpoint-tutorials"
echo "  - feature/office365-integration"
echo "  - feature/documentation"
echo ""
echo "🔄 Next steps:"
echo "  1. View branches at: https://github.com/pvestal/federal-hr-office365-tutorials/branches"
echo "  2. Create pull requests to merge into main"
echo "  3. Use branch protection rules for code review"