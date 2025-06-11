# SharePoint for HR Teams: Building Your Digital Workplace

## 🎯 Quick Start Guide
**Platform**: SharePoint Online | **Audience**: Federal HR Teams | **Deployment Time**: 2-3 hours

---

## 📑 Module Overview

### What You'll Build:
- 🏢 Complete HR Team Site with document libraries
- 📊 Employee onboarding tracker
- 📋 Policy management system  
- 🔄 Automated workflows
- 📱 Mobile-friendly pages

---

## 🚀 Part 1: Creating Your HR Team Site

### Step 1: Launch Your Site

1. **Navigate to**: https://[agency].sharepoint.com
2. **Click**: Create site → Team site
3. **Configure**:
   ```
   Site name: HR Central Hub
   Site address: /sites/HRCentral
   Privacy: Private
   Owners: HR-Managers@agency.gov
   Members: HR-Staff@agency.gov
   ```

### Step 2: Essential Site Settings

**Gear Icon** → **Site Settings**

#### Regional Settings
- **Time Zone**: (UTC-05:00) Eastern Time
- **Locale**: English (United States)
- **Work Week**: Monday - Friday
- **First Day of Week**: Sunday

#### Site Permissions
```
HR Leadership     → Full Control
HR Staff          → Edit
Managers          → Read
All Employees     → Limited Read (specific libraries only)
```

---

## 📁 Part 2: Document Library Structure

### Core HR Libraries Setup

#### 1. Employee Records (Secured)
```
📁 Employee Records
  └── 📁 Active Employees
      └── 📁 [Employee ID Folders]
          └── 📄 Onboarding Documents
          └── 📄 Performance Reviews  
          └── 📄 Training Records
  └── 📁 Separated Employees (Retention: 7 years)
  └── 📁 Templates
```

**Security Settings**:
- Break inheritance
- HR Only access
- Require check-out
- Version history: Major versions only

#### 2. HR Policies & Procedures
```
📁 Policies & Procedures
  └── 📁 Active Policies
      └── 📄 Leave Policies
      └── 📄 Code of Conduct
      └── 📄 Telework Agreements
  └── 📁 Under Review
  └── 📁 Archived
  └── 📁 Templates
```

**Metadata Columns**:
- Policy Type (Choice)
- Effective Date (Date)
- Review Date (Date)
- Owner (Person)
- Status (Active/Draft/Retired)

#### 3. Benefits Information
```
📁 Benefits
  └── 📁 Health Insurance
  └── 📁 Retirement (FERS/TSP)
  └── 📁 Life Insurance
  └── 📁 Enrollment Forms
  └── 📁 Summary Plan Descriptions
  └── 📁 FAQ Documents
```

### Creating Document Libraries

1. **Site Contents** → **New** → **Document library**
2. **Add columns**:
   ```powershell
   HR Category     | Choice    | Required
   Document Type   | Choice    | Required  
   Review Date     | Date      | Optional
   Confidential    | Yes/No    | Default: No
   Department      | Lookup    | Required
   ```

3. **Configure views**:
   - By Department
   - By Document Type
   - Recently Modified
   - My Documents

---

## 📊 Part 3: Lists for HR Operations

### Employee Onboarding Tracker

**Create List**: Site Contents → New → List → From blank

**Columns**:
| Column Name | Type | Settings |
|-------------|------|----------|
| Employee Name | Person | Required |
| Start Date | Date | Required |
| Position | Single line | Required |
| Department | Choice | Required |
| Onboarding Status | Choice | Not Started/In Progress/Completed |
| IT Setup | Yes/No | Default: No |
| Badge Issued | Yes/No | Default: No |
| Orientation Date | Date | Optional |
| Buddy Assigned | Person | Optional |
| Notes | Multiple lines | Optional |

**Conditional Formatting**:
- Start Date < Today + 7 days → Yellow highlight
- Start Date < Today → Red highlight
- Onboarding Status = Completed → Green background

### Training Tracker

**List Structure**:
```
- Employee Name (Person)
- Training Title (Lookup to Training Catalog)
- Date Completed (Date)
- Certificate (Attachment)
- Expiration Date (Date)
- Status (Not Started/In Progress/Completed/Overdue)
- Hours (Number)
- Training Type (Required/Optional)
```

**Calculated Columns**:
```
Days Until Expiration = [Expiration Date] - Today()
Status = IF([Expiration Date]<Today(),"Overdue",
         IF([Expiration Date]<Today()+30,"Due Soon","Current"))
```

---

## 🔄 Part 4: Power Automate Workflows

### Workflow 1: New Employee Onboarding

**Trigger**: When item created in Onboarding Tracker

**Actions**:
1. Create folder in Employee Records
2. Send welcome email to employee
3. Create tasks in Planner:
   - IT: Setup computer
   - Security: Issue badge
   - HR: Schedule orientation
4. Post to Teams: "New team member starting"

```json
{
  "trigger": "When an item is created",
  "actions": [
    {
      "type": "Create folder",
      "path": "/Employee Records/Active/@{triggerBody()?['EmployeeID']}"
    },
    {
      "type": "Send email",
      "to": "@{triggerBody()?['EmployeeEmail']}",
      "subject": "Welcome to @{variables('AgencyName')}!",
      "body": "Welcome email template..."
    }
  ]
}
```

### Workflow 2: Policy Review Reminder

**Trigger**: 30 days before Review Date

**Actions**:
1. Email policy owner
2. Create task in HR task list
3. Update policy status to "Under Review"
4. Set item-level permissions

### Workflow 3: Training Expiration Alerts

**Schedule**: Daily at 8 AM

**Logic**:
```
Get items where Expiration Date <= Today + 30
For each item:
  - Email employee
  - Email supervisor
  - Update status field
  - Log in compliance report
```

---

## 📱 Part 5: Modern Pages & Web Parts

### HR Landing Page Layout

```
┌─────────────────────────────────────┐
│         HR Central Banner           │
├─────────────┬───────────────────────┤
│             │                       │
│ Quick Links │   Announcements       │
│             │                       │
├─────────────┼───────────────────────┤
│             │                       │
│ HR Calendar │   Featured Content    │
│             │                       │
├─────────────┴───────────────────────┤
│        Document Libraries           │
└─────────────────────────────────────┘
```

### Essential Web Parts

#### 1. Quick Links
```
🏠 Employee Self-Service
📋 Submit Time & Attendance  
📞 HR Help Desk
📚 Training Portal
💰 Benefits Portal
🏥 Workers' Comp
```

#### 2. News Web Part
- Filter: HR News category
- Layout: Top story + 4 side stories
- Target audience: All employees

#### 3. Events Calendar
- Source: HR Calendar list
- View: Month view
- Categories: Training, Benefits, Holidays

#### 4. People Web Part
- Show: HR Team members
- Include: Photo, title, contact info
- Layout: Compact grid

---

## 🔐 Part 6: Security & Compliance

### Permission Levels

**Create Custom Permission Levels**:

1. **HR Full Control**
   - All permissions
   - Manage permissions
   - Delete items

2. **HR Contribute**
   - Add, edit items
   - Cannot delete
   - Cannot change permissions

3. **Employee Read**
   - View items
   - Download documents
   - Cannot see version history

### Information Management Policies

**Document Library Settings** → **Information management policy**

1. **Retention Policy**:
   ```
   Employee Records: 7 years after separation
   Policies: 3 years after retirement
   Benefits: Current year + 1
   Training: 5 years
   ```

2. **Auditing**:
   - Enable: View items, Edit items
   - Log location: Audit Reports library

3. **Labels**:
   - Print labels with classification
   - Include: Date, classification, owner

### Sensitivity Labels

Apply via **Microsoft Purview**:
- **Public**: Benefits guides, policies
- **Internal**: Procedures, contacts
- **Confidential**: Employee records
- **Highly Confidential**: Investigations

---

## 📈 Part 7: Reporting & Analytics

### HR Dashboard Page

**Key Metrics Web Parts**:

1. **Headcount Tracker**
   ```
   Total Employees: [Count]
   New This Month: [Count]
   Terminations: [Count]
   Vacancy Rate: [Percentage]
   ```

2. **Training Compliance**
   - Pie chart: Compliant vs Overdue
   - List: Employees with expired training

3. **Onboarding Status**
   - Progress bars by department
   - Average time to complete

### Power BI Integration

**Embed Power BI Report**:
1. Create report in Power BI Desktop
2. Publish to Power BI Service
3. Embed → SharePoint Online
4. Add to page via Power BI web part

**Sample HR Reports**:
- Turnover analysis
- Diversity metrics
- Time-to-fill positions
- Training ROI

---

## 🔧 Part 8: Maintenance & Best Practices

### Weekly Tasks
- [ ] Review new employee folders
- [ ] Check workflow history
- [ ] Archive completed items
- [ ] Update news/announcements

### Monthly Tasks
- [ ] Permission audit
- [ ] Storage analysis
- [ ] Inactive content review
- [ ] Search schema updates

### Governance Guidelines

1. **Naming Conventions**:
   ```
   YYYY-MM-DD_DocumentType_Description
   Example: 2024-01-15_Policy_TeleworkGuidelines
   ```

2. **Version Control**:
   - Major versions for published docs
   - Require check-out for editing
   - Keep last 10 major versions

3. **Metadata Standards**:
   - All documents must have HR Category
   - Effective dates required
   - Owner field mandatory

---

## 💡 Tips for Success

### Do's:
- ✅ Train team before launch
- ✅ Start with pilot group
- ✅ Document all customizations
- ✅ Regular backups to separate site
- ✅ Use hub sites for multi-department collaboration

### Don'ts:
- ❌ Over-complicate with too many columns
- ❌ Create deep folder structures (3 levels max)
- ❌ Ignore mobile experience
- ❌ Forget about external sharing settings
- ❌ Skip governance planning

---

## 🚦 Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| Sync errors | Check file names for special characters |
| Slow performance | Review list view thresholds (5000 items) |
| Missing documents | Check recycle bin and version history |
| Workflow failures | Review Power Automate run history |
| Permission errors | Verify inheritance settings |

---

## 📚 Additional Resources

- [SharePoint Online Limits](https://docs.microsoft.com/sharepoint/sharepoint-online-limits)
- [HR SharePoint Templates](https://lookbook.microsoft.com)
- [Federal Records Management](https://www.archives.gov)
- Agency IT Support: [Contact]

---

**Template Version**: 2.0 | **Last Updated**: [Date] | **Next Review**: [Date+90]

**Quick Actions**:
- 📥 [Download this guide as PDF]
- 📧 [Email to team]
- 📎 [Save to SharePoint]