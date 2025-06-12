# TFMMS (Total Force Manpower Management System) Position Management Guide

## 🎯 Overview
**System**: TFMMS | **Purpose**: Navy Manpower Authorization & Position Control | **Integration**: DCPDS

---

## Understanding TFMMS

### What is TFMMS?
Total Force Manpower Management System is the Navy's authoritative source for:
- Manpower authorizations (billets)
- Position requirements
- Organizational structure
- Military-to-civilian conversions
- Activity manning documents

### TFMMS vs DCPDS Relationship
```
TFMMS (Authorizations) ←→ DCPDS (Actual Employees)
- TFMMS: What positions we're authorized
- DCPDS: Who fills those positions
- Daily sync maintains alignment
```

---

## Module 1: TFMMS Access & Navigation

### System Access

#### Login Requirements
```
URL: https://tfmms.navy.mil
Authentication: CAC required
Network: NMCI or approved network
Browser: IE 11 or Edge compatibility mode
```

#### User Roles
| Role | Access Level | Typical User |
|------|--------------|--------------|
| Viewer | Read-only | HR Specialists |
| Updater | Edit positions | Manpower Analysts |
| Approver | Authorize changes | Command Leadership |
| Administrator | Full system | TFMMS Managers |

### Main Navigation

#### Dashboard Components
```
TFMMS Main Menu
├── AMD (Activity Manning Document)
│   ├── View AMD
│   ├── Position Details
│   └── Change History
├── Reports
│   ├── Manning Status
│   ├── Vacancy Reports
│   └── Reconciliation
├── Position Management
│   ├── Create Position
│   ├── Modify Position
│   └── Delete Position
└── Utilities
    ├── DCPDS Sync Status
    ├── Error Logs
    └── Help Resources
```

---

## Module 2: Understanding Position Structure

### Position Identification

#### Key Position Elements
```
UIC: 00018 (Unit Identification Code)
Billet Sequence: 001-999
Pay Plan: GS (General Schedule)
Series: 0201 (HR Management)
Grade: 12
Position Sequence: A-Z
```

#### Complete Position Number Example
```
00018-001-GS-0201-12-A

Breakdown:
00018 = BUMED Headquarters
001 = First billet in sequence
GS = Pay system
0201 = Job series
12 = Grade level
A = First position iteration
```

### Position Categories

#### Types of Positions
| Type | Description | DCPDS Impact |
|------|-------------|--------------|
| Permanent | Continuing positions | Full integration |
| Term | Time-limited (1-4 years) | Special coding |
| Temporary | Less than 1 year | Limited sync |
| Seasonal | Recurring periods | Activation/deactivation |

---

## Module 3: AMD Management

### Reading the AMD

#### AMD Layout
```
Activity Manning Document shows:
- Command information
- Organizational hierarchy  
- Position listings by department
- Military/civilian mix
- Required vs assigned
```

#### Key AMD Sections
1. **Header Information**
   - UIC and command name
   - Approval date
   - Change number
   - Total authorizations

2. **Position Details**
   ```
   Columns:
   - Billet number
   - Position title
   - Pay plan/series/grade
   - Required competencies
   - Special requirements
   - Incumbent (if filled)
   ```

3. **Summary Statistics**
   - Total authorized
   - Total assigned
   - Vacancy percentage
   - Civilian/military ratio

### Making AMD Changes

#### Change Request Process
1. **Identify Need**
   - Mission requirement
   - Workload analysis
   - Resource availability

2. **Submit in TFMMS**
   ```
   Path: Position Management → Create Change Request
   Required:
   - Justification memo
   - Funding verification
   - Impact statement
   - Org chart update
   ```

3. **Approval Chain**
   ```
   Typical flow:
   Department Head → Resource Manager → 
   Command Leadership → Regional → BUMED N1
   ```

---

## Module 4: Position Creation & Management

### Creating New Positions

#### Prerequisites
- [ ] Manning authorization approved
- [ ] Funding certified
- [ ] Position description classified
- [ ] Organizational placement determined

#### Step-by-Step Process
1. **Access Position Management**
   ```
   Menu: Position Management → Create Position
   ```

2. **Enter Core Data**
   ```
   Required Fields:
   - UIC: [Select from dropdown]
   - Department code
   - Pay plan/series/grade
   - Position title
   - Duty location
   - Supervisor position
   ```

3. **Add Requirements**
   ```
   Optional but recommended:
   - Education requirements
   - Certification needs
   - Security clearance
   - Special skills
   - Physical requirements
   ```

4. **Submit for Approval**
   ```
   System generates:
   - Change request number
   - Routing slip
   - Estimated completion date
   ```

### Modifying Existing Positions

#### Common Modifications
- Grade changes (upgrade/downgrade)
- Series changes (reclassification)
- Organization moves
- Duty location updates
- Supervisor changes

#### Modification Process
```
1. Locate position in TFMMS
2. Select "Modify Position"
3. Make required changes
4. Document justification
5. Submit for approval
6. Monitor status
```

---

## Module 5: TFMMS-DCPDS Synchronization

### Daily Sync Process

#### How Sync Works
```
Nightly batch process:
TFMMS (2200) → Interface file → 
DCPDS (0200) → Validation → 
Update positions → Error report
```

#### What Syncs Automatically
- Position establishments
- Grade changes
- Series updates
- Organization changes
- Position abolishments

#### What Requires Manual Action
- Incumbent assignments
- Special pay rates
- Position descriptions
- Functional codes
- Some location changes

### Managing Sync Errors

#### Common Sync Errors
| Error | Cause | Resolution |
|-------|-------|------------|
| Position not found | New in TFMMS | Wait 24 hours for sync |
| Grade mismatch | Recent change | Verify in both systems |
| Invalid org code | Reorg pending | Update org structure |
| Duplicate position | Data error | Research and correct |

#### Error Resolution Process
1. **Review Error Report**
   ```
   Path: Utilities → DCPDS Sync → Error Log
   Run: Daily after 0600
   ```

2. **Investigate Cause**
   - Check position in both systems
   - Verify recent changes
   - Review approval status

3. **Take Corrective Action**
   - Fix data in source system
   - Force manual sync
   - Document resolution

---

## Module 6: Reports & Analytics

### Standard TFMMS Reports

#### Manning Status Report
```
Shows:
- Authorized vs assigned
- Vacancy rates by department
- Fill percentage trends
- Critical position status

Use for:
- Weekly leadership briefs
- Recruitment prioritization
- Resource allocation
```

#### Position Reconciliation Report
```
Compares:
- TFMMS authorizations
- DCPDS positions
- Discrepancies identified
- Action items listed

Run: Monthly for audit
```

### Creating Custom Queries

#### Query Builder
```
Access: Reports → Ad Hoc Query

Useful queries:
1. Vacant positions > 90 days
2. Positions by grade/series
3. Recent position changes
4. Supervisor span of control
5. Geographic distribution
```

#### Export Options
- Excel for analysis
- PDF for briefings
- CSV for systems
- Direct to DCPDS

---

## Module 7: Special Processes

### Military-to-Civilian Conversions

#### Conversion Process
1. **Identify Military Billet**
   - Review AMD
   - Confirm conversion approval
   - Note rank/rate

2. **Create Civilian Position**
   ```
   Determine:
   - Appropriate GS level
   - Series classification
   - Position description
   - Qualification requirements
   ```

3. **System Updates**
   - Delete military billet
   - Establish civilian position
   - Update AMD
   - Sync with DCPDS

### Reorganizations

#### Reorg Impact on Positions
```
Planning required:
- Position mapping (old to new)
- Grade structure review
- Reporting relationships
- Location changes
- Timing coordination
```

#### Mass Position Updates
1. Create reorg package in TFMMS
2. Map all affected positions
3. Set effective date
4. Process as single transaction
5. Verify in DCPDS after sync

---

## Module 8: Best Practices

### Data Quality

#### Regular Audits
✓ Monthly position reconciliation
✓ Quarterly AMD review
✓ Annual position validation
✓ Continuous error monitoring
✓ Document all changes

#### Prevention Tips
- Double-check position numbers
- Verify grade/series combinations
- Confirm funding before creation
- Test org codes validity
- Use comments field

### Communication

#### Stakeholder Updates
```
When making changes:
1. Notify affected departments
2. Alert HR specialists
3. Update position incumbents
4. Brief leadership
5. Document in TFMMS
```

#### Standard Templates

##### New Position Notification
```
Subject: New Position Established - [Position Number]

A new position has been established:
- Position: [Title]
- Grade: [GS-XX]
- Location: [City]
- Organization: [Department]
- Effective: [Date]

This position will be available in DCPDS within 24 hours.
```

---

## Quick Reference

### Key Transactions
| Action | TFMMS Menu | DCPDS Impact | Timeline |
|--------|------------|--------------|----------|
| Create position | Position Mgmt → Create | Auto-add | 24 hours |
| Change grade | Position Mgmt → Modify | Auto-update | 24 hours |
| Delete position | Position Mgmt → Delete | Auto-remove | 24 hours |
| Reorg positions | Special → Reorg | Mass update | 48 hours |

### Important Dates
- AMD updates: 1st of month
- Reconciliation: 15th of month
- Annual validation: September
- Budget cycle: October-March

### System Contacts
- TFMMS Help Desk: 901-874-4744
- DCPDS Liaison: [Contact]
- Manpower Analyst: [Contact]
- Regional POC: [Contact]

### Common Position Codes
```
Admin: 0300 series
HR: 0200 series
IT: 2210 series
Medical: 0600 series
Finance: 0500 series
Logistics: 0346 series
```

Remember: TFMMS drives position structure - keep it accurate for successful HR operations!