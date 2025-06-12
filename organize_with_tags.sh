#!/bin/bash

echo "🏷️  Creating semantic version tags for tutorial modules..."

# Create tags for each major tutorial section
echo "Creating tags for better organization..."

# Tag for Excel tutorials
git tag -a v1.0-excel -m "Excel Tutorials Release v1.0

Features:
- Excel HR Data Analysis Tutorial
- Excel Advanced HR Formulas Guide

These comprehensive tutorials help federal HR professionals:
- Build interactive dashboards
- Analyze workforce metrics
- Automate reporting tasks
- Master complex formulas"

# Tag for Outlook tutorials
git tag -a v1.0-outlook -m "Outlook Tutorials Release v1.0

Features:
- Email Organization for HR Professionals
- Professional Communication Templates
- Rules and Automation Setup

Helps HR teams manage communications efficiently"

# Tag for SharePoint tutorials
git tag -a v1.0-sharepoint -m "SharePoint Tutorials Release v1.0

Features:
- Building HR Team Sites
- Document Management
- Workflow Automation
- Security Configuration

Complete guide for HR digital workplace"

# Tag for Teams tutorials  
git tag -a v1.0-teams -m "Teams Tutorials Release v1.0

Features:
- HR Team Collaboration Setup
- Meeting Management
- Apps Integration
- Virtual Interview Best Practices

Comprehensive Teams guide for HR professionals"

# Tag for PowerPoint tutorials
git tag -a v1.0-powerpoint -m "PowerPoint Tutorials Release v1.0

Features:
- HR Presentation Design
- Data Visualization
- Interactive Elements
- Professional Templates

Master impactful HR presentations"

# Tag for Office 365 Integration
git tag -a v1.0-office365 -m "Office 365 Integration Release v1.0

Features:
- Complete Platform Integration
- Power Platform for HR
- Customer Service Excellence
- Security & Compliance

Holistic Office 365 guide for HR teams"

# Create overall release tag
git tag -a v1.0.0 -m "Federal HR Office 365 Tutorials - Initial Release

Complete tutorial collection including:
- Excel (Data Analysis & Advanced Formulas)
- Outlook (Email Management)
- SharePoint (Team Collaboration)
- Teams (Virtual Collaboration)  
- PowerPoint (Presentations)
- Office 365 (Platform Integration)
- Customer Service Excellence

Created for federal HR professionals to enhance productivity and service delivery"

# Push all tags
echo ""
echo "🚀 Pushing tags to GitHub..."
git push origin --tags

echo ""
echo "✅ Tags created successfully!"
echo ""
echo "📋 View releases at:"
echo "https://github.com/pvestal/federal-hr-office365-tutorials/tags"
echo ""
echo "💡 You can now:"
echo "1. Create GitHub Releases from these tags"
echo "2. Add release notes and downloads"
echo "3. Track tutorial versions over time"