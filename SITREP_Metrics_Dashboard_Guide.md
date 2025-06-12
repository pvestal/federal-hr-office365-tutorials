# SITREP & Navy Medicine Metrics Dashboard Guide

## 🎯 Overview
**Purpose**: Weekly situation reporting for BUMED leadership | **Frequency**: Every Monday | **Platform**: PowerBI/SharePoint

---

## Understanding SITREP Requirements

### What is SITREP?
Situation Report (SITREP) provides Navy Medicine leadership with weekly HR metrics snapshots covering:
- Hiring progress
- Vacancy rates
- Personnel actions
- Critical issues
- Regional comparisons

### Key Stakeholders
- **BUMED N1**: Primary recipient
- **Regional Directors**: Review regional data
- **Command Leadership**: Monitor trends
- **HR Teams**: Provide input data

---

## Module 1: Data Collection Framework

### Weekly Data Points Required

#### 1. Staffing Metrics
```
Current as of: [Sunday 2359]
- Total authorized positions
- Onboard strength
- Vacancy rate (%)
- Gains (this week)
- Losses (this week)
```

#### 2. Hiring Pipeline
```
Active Recruitments:
- Total open announcements
- Applications received
- Certificates issued
- Selections made
- EOD pending
```

#### 3. Time-to-Fill Analysis
```
Average Days by Phase:
- Request to announcement: ___
- Announcement to certificate: ___
- Certificate to selection: ___
- Selection to EOD: ___
- Total time-to-fill: ___
```

#### 4. Critical Positions
```
GS-14+ and Mission Critical:
- Position title
- Location
- Vacancy duration
- Status update
- Projected fill date
```

### Data Sources Matrix

| Metric | Primary Source | Secondary Source | Validation |
|--------|----------------|------------------|------------|
| Onboard strength | DCPDS | Local tracking | Monthly roster |
| Vacancies | Position management | TFMMS | Reconciliation |
| Hiring pipeline | USAS | Local spreadsheet | Weekly audit |
| Time metrics | Report calculations | Manual tracking | Spot checks |

---

## Module 2: Building the Dashboard

### PowerBI Setup

#### Step 1: Data Connections
```
Data Sources Configuration:
1. DCPDS Extract (automated)
2. USAS API connection
3. SharePoint lists
4. Excel uploads (manual)
```

#### Step 2: Data Model Design
```
Tables Structure:
- DimDate (calendar)
- DimOrganization (hierarchy)
- FactStaffing (weekly snapshots)
- FactHiring (pipeline data)
- DimPosition (job details)
```

#### Step 3: Key Measures (DAX)
```dax
Vacancy Rate = 
DIVIDE(
    [Total Vacancies],
    [Authorized Positions],
    0
) * 100

Weekly Change = 
[Current Week Onboard] - [Prior Week Onboard]

Fill Rate = 
DIVIDE(
    [Positions Filled YTD],
    [Total Vacancies Start of Year],
    0
) * 100
```

### Dashboard Layout

#### Page 1: Executive Summary
```
┌─────────────────────────────────────────┐
│           BUMED HR SITREP               │
│         Week Ending: [Date]             │
├────────────┬────────────┬───────────────┤
│ Total      │ Vacancy    │ Weekly        │
│ Strength   │ Rate       │ Change        │
│ [Number]   │ [XX.X%]    │ [+/- XX]      │
├────────────┴────────────┴───────────────┤
│         Hiring Pipeline Chart           │
│         [Funnel Visualization]          │
├─────────────────────────────────────────┤
│      Regional Comparison Table          │
│      [Matrix with indicators]           │
└─────────────────────────────────────────┘
```

#### Page 2: Regional Breakdown
- Interactive map with drill-down
- Detailed metrics by region
- Trending over past 8 weeks
- Top vacancies list

#### Page 3: Hiring Analytics
- Pipeline stages breakdown
- Time-to-fill trending
- Bottleneck analysis
- Projection modeling

---

## Module 3: SharePoint Integration

### Creating the SITREP Site

#### Site Structure
```
/sites/BUMED-SITREP
├── Dashboard (PowerBI embed)
├── Data Input Forms
├── Historical Reports
├── Documentation
└── Regional Folders
    ├── East
    ├── West
    └── Central
```

### Input Forms Design

#### Microsoft Forms Integration
```
Weekly Data Collection Form:
- Region dropdown
- Reporting period
- Staffing numbers grid
- Issues/concerns text
- File upload option
```

#### Power Automate Workflow
```
Trigger: Form submission
Actions:
1. Parse form data
2. Update SharePoint list
3. Refresh PowerBI dataset
4. Send confirmation email
5. Log submission
```

---

## Module 4: Report Generation Process

### Monday Morning Routine

#### 7:00 AM - Data Validation
```
Checklist:
□ DCPDS extract completed
□ All regions submitted data
□ Prior week comparisons verified
□ Anomalies investigated
□ Missing data addressed
```

#### 8:00 AM - Dashboard Refresh
```
PowerBI Service:
1. Trigger manual refresh
2. Verify all visuals updated
3. Check for errors
4. Test interactivity
5. Review on mobile
```

#### 9:00 AM - Quality Review
```
Review Points:
- Numbers tie to source
- Trends make sense
- Comments accurate
- Formatting consistent
- Links working
```

#### 10:00 AM - Distribution
```
Email Template:
Subject: BUMED HR SITREP - Week Ending [Date]

Leadership,

This week's HR SITREP is available at: [Link]

Key Highlights:
- Overall vacancy rate: X%
- Net gain/loss: +/- X
- Critical fills: X positions

Full dashboard: [PowerBI Link]
```

---

## Module 5: Advanced Analytics

### Predictive Modeling

#### Hiring Projections
```
Formula:
Expected Fills = 
(Selections Made * Historical EOD Rate) + 
(Certificates Issued * Historical Selection Rate * EOD Rate) +
(Open Announcements * Historical Application Rate * ... )
```

#### Turnover Analysis
```
Retirement Eligible Analysis:
- Current eligible: XXX
- Eligible within 1 year: XXX
- Eligible within 3 years: XXX
- Risk assessment by position
```

### Drill-Through Capabilities

#### From Summary to Detail
```
Click Path:
Region Total → Command Level → Department → Individual Positions

Details Available:
- Position number
- Incumbent name (if filled)
- Vacancy duration
- Last action taken
```

---

## Module 6: Troubleshooting Common Issues

### Data Discrepancies

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Numbers don't match DCPDS | Timing of extract | Run after 6 AM Monday |
| Missing positions | Org code changes | Update mapping table |
| Wrong region assignment | Outdated hierarchy | Refresh org structure |
| Pipeline counts off | Manual tracking lag | Reconcile with USAS |

### Technical Issues

#### PowerBI Refresh Failures
```
Steps to resolve:
1. Check data source credentials
2. Verify network connectivity
3. Review refresh history
4. Check dataset size limits
5. Contact IT support
```

#### SharePoint Access Problems
```
Common fixes:
- Clear browser cache
- Check permissions
- Try different browser
- Verify VPN connection
- Update bookmarks
```

---

## Module 7: Best Practices

### Data Quality
✓ Establish single source of truth
✓ Document calculation methods
✓ Maintain audit trail
✓ Regular reconciliation
✓ Version control

### Visual Design
✓ Consistent color scheme
✓ Clear labeling
✓ Appropriate chart types
✓ Mobile responsive
✓ Accessibility compliant

### Communication
✓ Set stakeholder expectations
✓ Provide training to regions
✓ Create user guides
✓ Establish feedback loop
✓ Regular improvement cycles

---

## Quick Reference: Monday SITREP Checklist

### Pre-Monday Preparation
- [ ] Send reminder to regions (Friday)
- [ ] Verify system access
- [ ] Check last week's issues resolved
- [ ] Prepare template

### Monday Execution
- [ ] 0700: Pull DCPDS data
- [ ] 0730: Compile regional inputs
- [ ] 0800: Update dashboard
- [ ] 0830: Quality check
- [ ] 0900: Brief leadership
- [ ] 1000: Distribute report

### Post-Distribution
- [ ] Monitor for questions
- [ ] Document issues
- [ ] Update procedures
- [ ] Plan improvements

---

## Appendix: Report Specifications

### DCPDS Extracts
```
Report: Custom SITREP Extract
Tables: Employee, Position, Organization
Filters: Active employees, Navy Medicine UICs
Schedule: Monday 0600
Format: CSV
```

### PowerBI Configuration
```
Workspace: BUMED-Analytics
Dataset: HR_SITREP_Weekly
Refresh: Monday 0800
Row-Level Security: By region
Capacity: Premium
```

### SharePoint Settings
```
Site Collection: /sites/BUMED-SITREP
Permissions: 
- Owners: HR Analytics team
- Members: Regional HR leads
- Visitors: Leadership (read-only)
```

Remember: Accuracy and timeliness are critical - leadership decisions depend on this data!