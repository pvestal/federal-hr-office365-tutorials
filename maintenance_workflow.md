# Tutorial Maintenance Workflow

## Setup Version Control

```bash
# Initialize git repository
cd /home/patrick/work/tutorials
git init
git add *.md
git commit -m "Initial tutorial commit"

# Create update script
cat > update_tutorials.sh << 'EOF'
#!/bin/bash
# Update and deploy tutorials

echo "📝 Updating tutorials..."

# Pull latest changes
git pull

# Convert to all formats
./convert_tutorials.sh

# Upload to SharePoint (using Office 365 CLI)
# m365 spo file add --webUrl "https://agency.sharepoint.com/sites/HR" \
#   --folder "Shared Documents/Training" --path "pdf/*.pdf"

echo "✅ Tutorials updated and deployed!"
EOF

chmod +x update_tutorials.sh
```

## Benefits:
- ✅ Track all changes
- ✅ See who made edits
- ✅ Revert if needed
- ✅ Collaborate with branches
- ✅ Automated deployment

## Maintenance Process:
1. Edit .md files locally
2. Preview changes
3. Commit with descriptive message
4. Run update script
5. Auto-deploys everywhere