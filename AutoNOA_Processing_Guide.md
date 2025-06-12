# AutoNOA Processing & Workflow Management Guide

## 🎯 Overview
**System**: AutoNOA in DCPDS | **Purpose**: Automated Personnel Actions | **Users**: HR Specialists, SAT Managers

---

## Understanding AutoNOA

### What is AutoNOA?
AutoNOA (Automated Nature of Action) processes routine personnel actions automatically through DCPDS based on:
- Pre-configured business rules
- Validated data triggers
- Approved workflow routing
- System-generated notifications

### Benefits of AutoNOA
- ⚡ Reduces processing time by 75%
- ✅ Ensures consistency and accuracy  
- 📊 Provides audit trails
- 🔄 Frees HR staff for complex cases
- 📈 Improves customer satisfaction

---

## Module 1: AutoNOA Configuration

### Understanding AutoNOA Types

#### Currently Automated Actions
| NOA Code | Action Type | Trigger | Frequency |
|----------|------------|---------|-----------|
| 891 | Quality Step Increase (QSI) | Eligibility + approval | Monthly |
| 894 | Within-Grade Increase (WIGI) | Time-based calculation | Bi-weekly |
| 721 | Change in Duty Station | PCS orders | As needed |
| 792 | Change in Name | Legal documentation | As needed |
| 855 | FEHB Enrollment Change | Open season/QLE | Seasonal |
| 881 | TSP Contribution Change | Employee election | Bi-weekly |

### System Requirements

#### Technical Setup
```
DCPDS Access Level: AutoNOA Administrator
Browser: Chrome/Edge (latest)
Java: Updated version
Network: VPN required for remote
```

#### User Roles & Permissions
| Role | Access Level | Capabilities |
|------|--------------|--------------|
| HR Specialist | Submit/View | Create auto-actions, monitor |
| Reviewer | Review/Approve | Quality check, approve/reject |
| SAT Manager | Full Admin | Configure rules, override |
| Auditor | Read Only | View logs, run reports |

---

## Module 2: Processing Common AutoNOAs

### Within-Grade Increases (WIGI) - NOA 894

#### Automatic Processing Flow
```
System Check (Bi-weekly):
1. Identifies employees due for WIGI
2. Verifies acceptable performance
3. Calculates new salary
4. Generates SF-50
5. Updates payroll interface
```

#### HR Specialist Tasks
```
Weekly WIGI Report Review:
Path: DCPDS → Reports → AutoNOA → WIGI Pending

Actions Required:
□ Review exclusion list
□ Verify performance ratings
□ Process exceptions manually
□ Clear any system holds
```

#### Common WIGI Blocks
- Performance below Fully Successful
- Disciplinary action pending
- Temporary promotion active
- Grade retention situations

### Quality Step Increases (QSI) - NOA 891

#### Setup Requirements
```
Prerequisites:
- Current performance rating: Outstanding
- Supervisor recommendation
- Within-grade waiting period met
- Budget availability confirmed
```

#### Processing Steps
1. **Initiation**
   ```
   Menu: Personnel Actions → AutoNOA → QSI Request
   Enter: Employee SSN
   Verify: Eligibility checklist green
   Attach: Justification memo
   ```

2. **Routing Configuration**
   ```
   Standard QSI Approval Chain:
   HR Specialist → Immediate Supervisor → 
   Budget Officer → SAT Manager → System
   ```

3. **Monitoring Progress**
   ```
   Path: Workflow → My Actions → Pending QSIs
   Check: Status updates
   Expected timeline: 5-7 business days
   ```

---

## Module 3: Mass AutoNOA Processing

### Open Season Benefits Changes

#### Pre-Season Setup (October)
```
Configuration Checklist:
□ Update plan codes and rates
□ Configure effective dates (Jan 1)
□ Set processing schedule
□ Test in training environment
□ Prepare employee communications
```

#### Batch Processing Steps
1. **Data Import**
   ```
   Source: Benefits portal export
   Format: CSV with required fields
   - SSN
   - Action type
   - Plan code
   - Coverage level
   ```

2. **Validation Run**
   ```
   Menu: AutoNOA → Batch → Validate
   Review: Error report
   Fix: Data issues
   Rerun: Until clean
   ```

3. **Production Run**
   ```
   Schedule: After hours/weekend
   Monitor: Processing dashboard
   Output: SF-50 generation
   Verify: Payroll interface
   ```

### TSP Contribution Updates

#### Bi-Weekly Processing
```
Timeline:
- Monday: TSP elections close
- Tuesday: Extract from TSP system
- Wednesday: AutoNOA processing
- Thursday: Payroll deadline
- Friday: Confirmations sent
```

#### Special Considerations
- Catch-up contributions (50+)
- Roth vs Traditional
- Agency match calculations
- Annual IRS limit checks

---

## Module 4: Workflow Management

### Configuring Approval Chains

#### Standard Workflows
```
Simple (1-2 approvers):
Employee → HR → Complete

Complex (3+ approvers):
Employee → Supervisor → HR → 
Budget → Security → Complete
```

#### Creating Custom Workflows
1. **Access Workflow Designer**
   ```
   Path: Administration → AutoNOA → Workflow Designer
   Select: Create New Workflow
   ```

2. **Define Steps**
   ```
   For each step specify:
   - Role/Person
   - Action required
   - Time limit
   - Escalation rules
   ```

3. **Set Notifications**
   ```
   Email triggers:
   - Action received
   - Reminder (2 days)
   - Escalation (5 days)
   - Completion notice
   ```

### Managing Stuck Workflows

#### Diagnostic Steps
```
1. Identify stuck item:
   Reports → Workflow → Aging Report

2. Check current status:
   Click transaction → View History

3. Common causes:
   - Approver on leave
   - Missing data
   - System timeout
   - Role not assigned
```

#### Resolution Actions
| Issue | Solution | Prevention |
|-------|----------|------------|
| Approver unavailable | Reassign to delegate | Set alternates |
| Missing data | Add required field | Validation rules |
| System error | Resubmit transaction | Regular maintenance |
| Wrong routing | Correct and restart | Test workflows |

---

## Module 5: AutoNOA Reports & Metrics

### Standard Reports Suite

#### Daily Operations Reports
1. **AutoNOA Processing Summary**
   ```
   Shows: Actions processed last 24 hours
   Includes: Success/failure counts
   Use: Morning check
   ```

2. **Pending Actions Report**
   ```
   Shows: Items awaiting processing
   Includes: Age and assigned person
   Use: Workload management
   ```

3. **Error Log Report**
   ```
   Shows: Failed transactions
   Includes: Error codes and descriptions
   Use: Troubleshooting
   ```

#### Management Reports

##### Monthly AutoNOA Statistics
```
Metrics Included:
- Total actions by type
- Average processing time
- Error rates by category
- User productivity
- Compliance percentages
```

##### Audit Trail Report
```
Path: Reports → AutoNOA → Audit Trail
Parameters:
- Date range
- Action types
- User ID
- Organization

Output: Complete transaction history
```

### Creating Custom Queries

#### Query Builder Basics
```sql
-- Example: WIGIs processed this month
SELECT 
    employee_name,
    action_date,
    old_salary,
    new_salary,
    processing_time
FROM autonoa_log
WHERE noa_code = '894'
    AND action_date >= TRUNC(SYSDATE, 'MM')
ORDER BY action_date DESC;
```

---

## Module 6: Troubleshooting & Error Resolution

### Common Error Codes

| Code | Description | Resolution |
|------|-------------|------------|
| E001 | Duplicate action exists | Check pending queue |
| E002 | Invalid effective date | Verify date logic |
| E003 | Insufficient data | Complete required fields |
| E004 | Authorization failure | Check user permissions |
| E005 | Budget constraint | Verify funding |

### System Performance Issues

#### Slow Processing
```
Diagnostic steps:
1. Check system status page
2. Review batch queue size
3. Verify network connectivity
4. Check concurrent users

Solutions:
- Process during off-hours
- Split large batches
- Clear old data
- Request system resources
```

#### Failed Batch Jobs
```
Recovery process:
1. Identify failure point
2. Export processed records
3. Fix data issues
4. Rerun failed items only
5. Verify completion
```

---

## Module 7: Best Practices & Compliance

### Quality Assurance

#### Pre-Processing Checks
✓ Verify source data accuracy
✓ Confirm business rules current
✓ Test in training environment
✓ Review approval chains
✓ Check effective dates

#### Post-Processing Validation
✓ Audit sample of SF-50s
✓ Verify payroll interface
✓ Check employee notifications
✓ Review error reports
✓ Document exceptions

### Compliance Requirements

#### Record Keeping
```
Retention Requirements:
- SF-50s: Permanent in eOPF
- Audit logs: 7 years
- Error reports: 3 years
- Workflow history: 3 years
```

#### Privacy & Security
- Only process authorized actions
- Protect PII at all times
- Use secure connections
- Log all access
- Report incidents immediately

---

## Module 8: Advanced Features

### Bulk Upload Processing

#### Preparing Data Files
```
CSV Format Requirements:
Column A: SSN (no dashes)
Column B: NOA code
Column C: Effective date (MM/DD/YYYY)
Column D: Additional data as needed

Example:
123456789,894,01/15/2024
987654321,891,01/15/2024
```

#### Upload Process
1. Validate file format
2. Check for duplicates
3. Run test import
4. Review validation report
5. Process production file
6. Monitor completion

### API Integration

#### Connecting External Systems
```
Available APIs:
- Benefits enrollment systems
- Payroll interfaces
- Time & attendance
- Performance management

Configuration:
- Endpoint URLs
- Authentication tokens
- Data mapping
- Error handling
```

---

## Quick Reference Guide

### Daily Checklist
- [ ] Review overnight processing results
- [ ] Check error queue
- [ ] Process new requests
- [ ] Clear pending approvals
- [ ] Update tracking spreadsheet

### Weekly Tasks
- [ ] Run WIGI eligibility report
- [ ] Process benefits changes
- [ ] Audit random samples
- [ ] Clean up old workflows
- [ ] Update metrics dashboard

### Monthly Activities
- [ ] Generate management reports
- [ ] Review processing statistics
- [ ] Update business rules
- [ ] Conduct user training
- [ ] System maintenance

### Key Contacts
- DCPDS Help Desk: 703-604-1919
- AutoNOA Support: [Contact]
- SAT Manager: [Contact]
- Payroll Interface: [Contact]

Remember: AutoNOA is powerful but requires careful configuration and monitoring!