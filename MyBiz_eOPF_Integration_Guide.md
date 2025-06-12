# MyBiz+ and eOPF Integration Guide

## 🎯 Overview
**Systems**: MyBiz+ Employee Portal & Electronic Official Personnel Folder | **Users**: All HR Staff | **Integration**: Seamless

---

## Understanding the Systems

### MyBiz+ Overview
MyBiz+ is the employee self-service portal providing:
- Personal information management
- Benefits elections
- Performance management (DPMAP)
- Training records
- Leave and earnings statements

### eOPF Overview
Electronic Official Personnel Folder contains:
- All permanent personnel documents
- SF-50s (Notification of Personnel Actions)
- Performance appraisals
- Benefits elections
- Training certificates

### Integration Points
```
MyBiz+ Actions → DCPDS Processing → eOPF Storage
Employee Updates → HR Verification → Document Filing
Benefits Changes → AutoNOA → Permanent Record
```

---

## Module 1: MyBiz+ Navigation for HR Staff

### Accessing MyBiz+ as HR

#### Two Access Methods
1. **Direct Employee Support**
   ```
   URL: https://compo.dcpds.cpms.osd.mil
   Login: Your CAC
   Role: HR Representative
   Function: View employee screens
   ```

2. **Administrative Access**
   ```
   Through DCPDS:
   Main Menu → MyBiz+ Admin → Employee Lookup
   Purpose: Troubleshooting and support
   ```

### Key MyBiz+ Sections for HR

#### Employee Information Tab
```
Viewable Data:
- Personal details
- Contact information
- Emergency contacts
- Direct deposit
- Tax withholdings

HR Actions:
- Verify updates
- Assist with errors
- Process corrections
- Guide employees
```

#### Benefits Tab
```
Components:
- FEHB enrollment
- Life insurance
- TSP contributions
- FSA elections
- Beneficiaries

Critical Dates:
- Open Season: Nov-Dec
- QLE: 60 days from event
```

#### Performance Tab (DPMAP)
```
HR Can View:
- Current performance plan
- Progress review status
- Rating history
- Goals and objectives

HR Cannot:
- Edit performance data
- Change ratings
- Modify goals
```

---

## Module 2: eOPF Management

### Accessing eOPF

#### Login Process
```
URL: https://eopf.opm.gov/navy
Authentication: CAC required
Initial screen: Search function
```

#### Search Methods
1. **By SSN** (most common)
2. **By Name** (last, first)
3. **By Employee ID**
4. **Advanced Search** (multiple criteria)

### eOPF Folder Structure

#### Standard Folders
```
📁 eOPF Main Folder
├── 📁 Benefits
│   ├── FEHB Elections
│   ├── FEGLI Forms
│   └── TSP Elections
├── 📁 Employment
│   ├── SF-50s
│   ├── Position Descriptions
│   └── Appointment Documents
├── 📁 Performance
│   ├── Appraisals
│   ├── Awards
│   └── Recognition
├── 📁 Training
│   ├── Certificates
│   ├── Transcripts
│   └── Development Plans
└── 📁 Miscellaneous
    ├── Emergency Contact
    ├── Military Service
    └── Other Documents
```

### Document Upload Process

#### Preparing Documents
```
Requirements:
- PDF format only
- Max 5MB per file
- Clear, legible scans
- Correct orientation
- No password protection
```

#### Upload Steps
1. **Select Employee Folder**
2. **Choose Document Type**
   ```
   Dropdown includes:
   - SF-50
   - Performance Appraisal
   - Training Certificate
   - Benefits Form
   - Other (specify)
   ```
3. **Add Metadata**
   ```
   Required fields:
   - Document date
   - Effective date
   - Description
   - Category
   ```
4. **Upload and Verify**

---

## Module 3: MyBiz+ to eOPF Workflow

### Benefits Changes Flow

#### Employee Initiates in MyBiz+
```
Example: FEHB Change
1. Employee logs into MyBiz+
2. Selects Benefits → FEHB
3. Makes enrollment change
4. Submits with QLE documentation
```

#### HR Processing
```
HR Actions:
1. Receive notification in DCPDS
2. Verify QLE documentation
3. Approve/process change
4. AutoNOA generates SF-50
```

#### eOPF Filing
```
Automatic Actions:
1. SF-50 auto-files to eOPF
2. Enrollment form copies to Benefits folder
3. QLE documentation retained
4. Confirmation to employee
```

### Address/Contact Updates

#### MyBiz+ Employee Update
```
Employee can change:
- Mailing address
- Phone numbers
- Email address
- Emergency contacts
```

#### Automatic Processing
```
System flow:
MyBiz+ entry → Overnight batch → 
DCPDS update → No SF-50 needed → 
eOPF updated (emergency contact form)
```

---

## Module 4: Document Management Best Practices

### What Goes in eOPF

#### Required Documents
| Document Type | Retention | Auto-File |
|--------------|-----------|-----------|
| SF-50s | Permanent | Yes |
| Performance appraisals | Permanent | Yes |
| Benefits elections | Permanent | Yes |
| Training records (mandatory) | Permanent | No |
| Awards/recognition | Permanent | No |

#### Do NOT Include
- Medical records (Privacy Act)
- Disciplinary documents (separate file)
- Daily correspondence
- Drafts or working documents
- Personal items

### Quality Control

#### Document Review Checklist
- [ ] Correct employee name/SSN
- [ ] Proper document type selected
- [ ] Dates accurate
- [ ] All pages included
- [ ] Legible scan quality
- [ ] Right-side up orientation
- [ ] No duplicate uploads

#### Monthly Audits
```
Audit 5% sample checking:
- Document categorization
- Upload timeliness
- Missing documents
- Duplicate entries
- Access logs
```

---

## Module 5: Troubleshooting Common Issues

### MyBiz+ Problems

| Issue | Cause | Solution |
|-------|-------|----------|
| Can't log in | Account locked | Reset in DCPDS Admin |
| Benefits tab missing | Not benefits eligible | Verify employment status |
| Data not saving | Session timeout | Re-login and retry |
| Wrong information displayed | Data sync issue | Force refresh from DCPDS |

### eOPF Problems

| Issue | Cause | Solution |
|-------|-------|----------|
| Documents not visible | Processing delay | Wait 24 hours |
| Upload fails | File too large | Reduce PDF size |
| Wrong folder | Miscategorized | Move document |
| Missing historical docs | Pre-electronic | Check paper OPF |

### Integration Issues

#### Data Sync Problems
```
Symptoms:
- MyBiz+ shows different data than DCPDS
- eOPF missing recent actions
- Benefits not reflecting

Resolution:
1. Identify source system
2. Verify data accuracy
3. Force synchronization
4. Monitor overnight batch
```

---

## Module 6: Reports and Queries

### MyBiz+ Usage Reports

#### HR Dashboard Access
```
Path: DCPDS → Reports → MyBiz+ → Usage Statistics

Available Reports:
- Login frequency
- Features used
- Error rates
- Update statistics
```

### eOPF Audit Reports

#### Document Compliance Report
```
Shows:
- Missing required documents
- Overdue uploads
- Categorization errors
- Access violations

Run monthly for your organization
```

#### Access Log Report
```
Tracks:
- Who viewed folders
- When accessed
- What downloaded
- Unusual patterns

Use for security monitoring
```

---

## Module 7: Security and Privacy

### Access Controls

#### MyBiz+ Permissions
```
Employees see: Own data only
HR sees: Assigned employees
Supervisors see: Direct reports (limited)
System admin: All (with audit)
```

#### eOPF Permissions
| Role | View | Upload | Delete | Move |
|------|------|--------|--------|------|
| Employee | Own | No | No | No |
| HR Specialist | Assigned | Yes | No | Yes |
| HR Supervisor | All in org | Yes | Yes | Yes |
| Records Mgr | All | Yes | Yes | Yes |

### Privacy Requirements

#### Handling PII
- View only when necessary
- Never download to personal devices
- Use secure connections
- Lock screen when away
- Report any breaches immediately

#### Audit Trail
```
All actions logged:
- User ID
- Timestamp
- Action taken
- Document affected
- IP address
```

---

## Module 8: Best Practices

### For HR Staff

#### Daily Tasks
✓ Check MyBiz+ error queue
✓ Process pending eOPF uploads
✓ Assist employee inquiries
✓ Verify overnight batches
✓ Clear workflow items

#### Weekly Tasks
✓ Run sync verification report
✓ Audit recent uploads
✓ Review access logs
✓ Update tracking metrics
✓ Train new employees

### Communication Templates

#### MyBiz+ Navigation Help
```
Subject: How to Update Your Address in MyBiz+

Steps:
1. Log into MyBiz+ with your CAC
2. Click "Employee Information"
3. Select "Addresses"
4. Click "Edit"
5. Update and save

Changes effective next business day.
```

#### eOPF Access Instructions
```
Subject: Accessing Your eOPF

Your electronic personnel folder is available at:
https://eopf.opm.gov/navy

Login with CAC
Search by your SSN
View/print your documents

Contact HR for assistance.
```

---

## Quick Reference

### System URLs
- MyBiz+: https://compo.dcpds.cpms.osd.mil
- eOPF: https://eopf.opm.gov/navy
- DCPDS: https://dcpds.cpms.osd.mil

### Processing Times
- MyBiz+ to DCPDS: Overnight
- DCPDS to eOPF: 24-48 hours
- Benefits changes: 1-2 pay periods
- Address updates: Next business day

### Help Resources
- MyBiz+ Help: Through system
- eOPF Support: 1-866-275-8518
- DCPDS Help: 703-604-1919
- Local HR: [Your contact]

Remember: These systems work together - understanding the integration helps you serve employees better!