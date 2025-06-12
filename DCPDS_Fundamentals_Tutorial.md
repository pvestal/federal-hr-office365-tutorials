# DCPDS Fundamentals for Navy Medicine HR

## 🎯 Quick Reference Guide
**System**: Defense Civilian Personnel Data System | **Audience**: All HR Staff | **Duration**: 2-4 hours

---

## Module 1: DCPDS Navigation Essentials

### Logging In
1. Navigate to: https://dcpds.cpms.osd.mil
2. Insert CAC and enter PIN
3. Select appropriate role if you have multiple

### Main Menu Structure
```
DCPDS Main Menu
├── Personnel Actions (PAR)
│   ├── Create New Action
│   ├── View Pending Actions
│   └── Action History
├── Employee Data
│   ├── View/Update Records
│   ├── Position Management
│   └── Organizational Data
├── Reports
│   ├── Standard Reports
│   ├── Ad Hoc Query
│   └── Scheduled Reports
└── Utilities
    ├── Workflow Status
    ├── User Preferences
    └── Help Resources
```

### Essential Keyboard Shortcuts
- **F1**: Context-sensitive help
- **F3**: Return to previous screen
- **F7**: Page up in lists
- **F8**: Page down in lists
- **F10**: Save current record
- **F12**: Cancel/Exit

---

## Module 2: Personnel Action Request (PAR) Processing

### Creating a New PAR

#### Step 1: Initiate Action
```
Menu Path: Personnel Actions → Create New Action
Required Fields:
- SSN or Employee ID
- Effective Date
- Nature of Action (NOA)
- Legal Authority
```

#### Step 2: Common NOA Codes
| Code | Description | Use Case |
|------|-------------|----------|
| 702 | Change to Lower Grade | Voluntary downgrade |
| 703 | Change to Lower Grade | Involuntary downgrade |
| 713 | Position Change | Same grade lateral |
| 792 | Name Change | Marriage, divorce, etc. |
| 800 | Retirement | FERS/CSRS retirement |
| 891 | QSI | Quality Step Increase |

#### Step 3: Routing Rules
```
Standard Routing Chain:
1. HR Specialist (Create)
2. HR Reviewer (Quality Check)
3. Supervisor (Approval)
4. SAT Manager (Final Review)
5. System (Auto-process)
```

### PAR Status Codes
- **INIT**: Initiated, not yet submitted
- **PEND**: Pending review
- **APPR**: Approved, awaiting processing
- **PROC**: Processing in system
- **COMP**: Completed successfully
- **CANC**: Cancelled
- **ERRR**: Error - needs correction

---

## Module 3: Employee Data Management

### Viewing Employee Records

#### Navigation Path
```
Employee Data → View/Update Records → Enter SSN/Name
```

#### Key Screens
1. **Personal Data**: Name, DOB, contact info
2. **Position Data**: Title, series, grade, org
3. **Service Data**: SCD, retirement info
4. **Benefits Data**: FEHB, FEGLI, TSP

### Updating Employee Information

#### Permissible Updates by HR Staff
- ✅ Address changes
- ✅ Emergency contacts
- ✅ Phone numbers
- ✅ Email addresses
- ⚠️ Name changes (requires documentation)
- ❌ SSN changes (requires special access)

#### Update Process
1. Navigate to appropriate screen
2. Click "Update" button
3. Make changes in edit mode
4. Verify changes highlighted in yellow
5. Press F10 to save
6. Confirm update message

---

## Module 4: Report Generation

### Standard Reports Menu

#### Most-Used Reports for Navy Medicine
1. **PER-108**: DCPDS User Responsibilities
2. **PER-143**: Position Organization Address (POA)
3. **PER-210**: Correction Role Listing
4. **RES-003**: DPMAP Annual Appraisal Details

### Running Standard Reports

#### Basic Steps
```
1. Reports → Standard Reports
2. Select report category
3. Choose specific report
4. Enter parameters:
   - Date range
   - Organization code
   - Employee status
5. Select output format:
   - Screen view
   - PDF export
   - Excel download
6. Click "Run Report"
```

### Report Parameters Tips
- Use wildcards (%) for partial matches
- Leave fields blank for "all"
- Save frequently-used parameter sets
- Schedule recurring reports

---

## Module 5: Common Transactions

### Address Change
```
Path: Employee Data → Personal → Addresses
Steps:
1. Select address type
2. Click "Add New" or "Update"
3. Enter new address
4. Set effective date
5. Save (F10)
```

### Position Description Update
```
Path: Position Management → PD Library
Steps:
1. Search for PD number
2. Click "Create Version"
3. Make updates
4. Route for classification
5. Track status
```

### Awards Processing
```
Path: Personnel Actions → Create New → NOA 846/849
Required:
- Award type
- Amount/Time off hours
- Justification
- Approval documentation
```

---

## Module 6: Troubleshooting

### Common Error Messages

| Error | Meaning | Solution |
|-------|---------|----------|
| "Invalid NOA/LAC combination" | Legal authority doesn't match action | Check NOA/LAC guide |
| "Employee not found" | SSN/ID mismatch | Verify in employee search |
| "Insufficient privileges" | Access restriction | Contact SAT Manager |
| "Duplicate action exists" | PAR already in system | Check pending actions |

### When to Escalate
- System locks/freezes
- Data integrity issues
- Access problems
- Workflow stuck >48 hours

### Help Resources
- **System Help**: F1 key
- **DCPDS Manual**: Help menu
- **Navy Medicine POC**: HRIS specialist
- **CPMS Help Desk**: 703-604-1919

---

## Module 7: Best Practices

### Data Quality
- ✓ Verify SSN twice before submission
- ✓ Use employee lookup to confirm identity
- ✓ Check effective dates carefully
- ✓ Review all changes before saving

### Workflow Efficiency
- ✓ Process similar actions in batches
- ✓ Use templates for repeated actions
- ✓ Set up saved searches
- ✓ Monitor inbox regularly

### Security Reminders
- 🔒 Lock workstation when away
- 🔒 Never share login credentials
- 🔒 Report suspicious activity
- 🔒 Follow PII handling procedures

---

## Quick Reference Cards

### Daily Tasks Checklist
- [ ] Check workflow inbox
- [ ] Process pending PARs
- [ ] Review error queue
- [ ] Generate daily reports
- [ ] Clear completed items

### Month-End Tasks
- [ ] Run employee roster report
- [ ] Verify org structure updates
- [ ] Process mass pay adjustments
- [ ] Archive completed actions
- [ ] Update metrics dashboard

---

## Practice Exercises

### Exercise 1: Basic Navigation
1. Log into DCPDS training environment
2. Navigate to three different menu areas
3. Use F3 to return to main menu
4. Set up quick links for frequent tasks

### Exercise 2: Simple PAR
1. Create address change PAR
2. Route for approval
3. Check workflow status
4. Verify completion

### Exercise 3: Report Generation
1. Run PER-143 POA report
2. Export to Excel
3. Filter for your UIC
4. Save parameters

---

## Appendix: Navy Medicine Specific

### Organization Codes
- BUMED HQ: 00018
- BUMED East: Various
- BUMED West: Various
- BUMED Central: Various

### Approval Chains
- Standard HR actions: 2-3 levels
- Senior positions: 4-5 levels
- SES actions: Special routing

### Key Contacts
- DCPDS Helpdesk: 703-604-1919
- Navy Medicine HRIS: [Your contact]
- Regional SAT Managers: [List]

Remember: When in doubt, ask before processing!