# SharePoint-Based Tutorial Maintenance

## Setup in SharePoint

### 1. Create Document Library Structure
```
Training Materials/
├── 01_Master_Documents/     (Word files for editing)
├── 02_Published_PDFs/       (Auto-generated PDFs)
├── 03_Archive/              (Previous versions)
└── 04_Resources/            (Images, templates)
```

### 2. Enable Version Control
- Library Settings → Versioning Settings
- ✅ Create major and minor versions
- ✅ Require check-out
- Keep 10 major versions

### 3. Set Up Power Automate Flow

**Trigger**: When a file is modified in Master_Documents
**Actions**:
1. Convert Word to PDF
2. Save PDF to Published_PDFs
3. Send notification to HR team
4. Update "Last Modified" in tracking list
5. Archive previous version

### 4. Create Update Tracking List

| Tutorial Name | Last Updated | Updated By | Version | Next Review |
|--------------|--------------|------------|---------|-------------|
| Excel Guide | 11/6/2024 | Jane Doe | 2.1 | 2/6/2025 |

## Benefits:
- ✅ Familiar Word interface
- ✅ Built-in collaboration
- ✅ Automatic notifications
- ✅ No technical skills needed
- ✅ Integrated with Office 365

## Maintenance Process:
1. Check out Word document
2. Make edits with Track Changes
3. Save and check in
4. Flow auto-converts to PDF
5. Team notified of updates