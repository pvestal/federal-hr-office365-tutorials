# Power BI for HR: Building Interactive Analytics Dashboards

## 🎯 Transform HR Data into Actionable Insights
**Platform**: Power BI Desktop & Service | **Level**: Beginner to Advanced | **Duration**: 3 hours

---

## 📊 Module 1: Power BI Fundamentals for HR

### Getting Started with Power BI

#### Installation & Setup
1. **Download Power BI Desktop** (free)
   - Visit: https://powerbi.microsoft.com/desktop
   - Install and launch
   - Sign in with Office 365 credentials

2. **Power BI Service Access**
   - Navigate to: https://app.powerbi.com
   - Workspace: Create "HR Analytics"
   - Capacity: Check with IT for Pro licenses

### Understanding Power BI Components

```
Power BI Ecosystem for HR
├── Power BI Desktop (Development)
│   ├── Data Connections
│   ├── Data Modeling
│   └── Report Creation
├── Power BI Service (Sharing)
│   ├── Workspaces
│   ├── Apps
│   └── Dashboards
└── Power BI Mobile (Access)
    ├── iOS/Android Apps
    └── Responsive Reports
```

---

## 🔌 Module 2: Connecting to HR Data Sources

### Common HR Data Sources

#### 1. Excel Files
```powerbi
Home → Get Data → Excel
Navigate to: HR_Master_Data.xlsx
Select tables:
- EmployeeData
- PayrollSummary
- TimeOffRecords
```

#### 2. SharePoint Lists
```powerbi
Get Data → Online Services → SharePoint Online List
Site URL: https://agency.sharepoint.com/sites/HR
Select lists:
- Employee Directory
- Training Records
- Performance Reviews
```

#### 3. SQL Database
```powerbi
Get Data → Database → SQL Server
Server: hr-sql.agency.gov
Database: HRISProd
Tables: Select relevant HR tables
```

#### 4. Dynamics 365 HR
```powerbi
Get Data → Online Services → Dynamics 365
Environment URL: agency.crm.dynamics.com
Entities: Workers, Positions, Leave
```

### Data Connection Best Practices

**Import vs DirectQuery**
| Mode | Use When | Pros | Cons |
|------|----------|------|------|
| Import | Data < 1GB, Daily refresh | Fast, Full DAX | Storage limits |
| DirectQuery | Real-time needs | Always current | Slower, Limited DAX |
| Composite | Mixed requirements | Flexibility | Complex |

---

## 🧹 Module 3: Data Transformation for HR

### Power Query Editor Basics

#### Essential Transformations

**1. Standardize Employee Names**
```m
= Table.TransformColumns(Source,{
    {"EmployeeName", Text.Proper},
    {"EmployeeID", Text.Upper}
})
```

**2. Calculate Tenure**
```m
= Table.AddColumn(Source, "TenureYears", 
    each Duration.Days([CurrentDate] - [HireDate]) / 365.25,
    type number)
```

**3. Create Age Bands**
```m
= Table.AddColumn(Source, "AgeBand", 
    each if [Age] < 30 then "Under 30"
    else if [Age] < 40 then "30-39"
    else if [Age] < 50 then "40-49"
    else if [Age] < 60 then "50-59"
    else "60+")
```

### HR-Specific Data Cleaning

#### Handling Employee Status
```m
= Table.ReplaceValue(Source,
    each [Status],
    each if [Status] = null then "Unknown"
    else if Text.Contains([Status], "Active") then "Active"
    else if Text.Contains([Status], "Term") then "Terminated"
    else "Other",
    Replacer.ReplaceValue,
    {"Status"})
```

#### Fiscal Year Calculations
```m
= Table.AddColumn(Source, "FiscalYear", 
    each if Date.Month([Date]) >= 10 
    then Date.Year([Date]) + 1 
    else Date.Year([Date]))
```

---

## 📐 Module 4: HR Data Modeling

### Building the HR Data Model

#### Star Schema for HR Analytics
```
Fact Tables (Center):
├── FactEmployeeSnapshot (Daily/Monthly)
├── FactTimeOff
├── FactRecruitment
└── FactTraining

Dimension Tables (Surrounding):
├── DimEmployee
├── DimDate
├── DimDepartment
├── DimPosition
├── DimLocation
└── DimManager
```

### Creating Relationships

**Key Relationships**:
1. FactEmployeeSnapshot[EmployeeID] → DimEmployee[EmployeeID]
2. FactEmployeeSnapshot[DateKey] → DimDate[DateKey]
3. FactEmployeeSnapshot[DepartmentID] → DimDepartment[DepartmentID]
4. DimEmployee[ManagerID] → DimEmployee[EmployeeID] (self-referencing)

### DAX Measures for HR

#### Headcount Calculations
```dax
// Current Headcount
Headcount = 
CALCULATE(
    COUNTROWS(DimEmployee),
    DimEmployee[Status] = "Active"
)

// Headcount Last Year
Headcount LY = 
CALCULATE(
    [Headcount],
    SAMEPERIODLASTYEAR(DimDate[Date])
)

// Headcount Growth %
Headcount Growth % = 
DIVIDE(
    [Headcount] - [Headcount LY],
    [Headcount LY],
    0
)
```

#### Turnover Metrics
```dax
// Turnover Rate
Turnover Rate = 
VAR Terminations = 
    CALCULATE(
        COUNTROWS(FactEmployeeSnapshot),
        FactEmployeeSnapshot[Action] = "Termination"
    )
VAR AvgHeadcount = 
    AVERAGE(FactEmployeeSnapshot[Headcount])
RETURN
    DIVIDE(Terminations, AvgHeadcount, 0) * 100

// Voluntary Turnover
Voluntary Turnover = 
CALCULATE(
    [Turnover Rate],
    FactEmployeeSnapshot[TerminationType] = "Voluntary"
)
```

#### Diversity Metrics
```dax
// Gender Diversity Index
Gender Diversity Index = 
VAR TotalEmployees = [Headcount]
VAR GenderCounts = 
    SUMMARIZE(
        DimEmployee,
        DimEmployee[Gender],
        "Count", COUNTROWS(DimEmployee)
    )
VAR SumOfSquares = 
    SUMX(
        GenderCounts,
        DIVIDE([Count], TotalEmployees) ^ 2
    )
RETURN
    1 - SumOfSquares
```

---

## 📈 Module 5: Building HR Reports

### Executive HR Dashboard

#### Page 1: Overview Dashboard
```
Layout:
┌─────────────────────────────────────────┐
│         HR Executive Dashboard          │
├──────────┬──────────┬──────────────────┤
│Headcount │ Turnover │ Time to Fill    │
│  Card    │   Card   │    Card         │
├──────────┴──────────┴──────────────────┤
│     Headcount Trend (Line Chart)       │
├─────────────────────┬───────────────────┤
│Department Breakdown │ Diversity Metrics │
│  (Tree Map)        │ (Donut Charts)    │
└─────────────────────┴───────────────────┘
```

### Key Visualizations

#### 1. Headcount Waterfall
Shows monthly changes:
- Starting headcount
- New hires (+)
- Terminations (-)
- Transfers (+/-)
- Ending headcount

#### 2. Turnover Heatmap
Matrix visual showing:
- Rows: Departments
- Columns: Months
- Values: Turnover rate
- Conditional formatting: Red/Yellow/Green

#### 3. Span of Control
Scatter plot:
- X-axis: Number of direct reports
- Y-axis: Manager level
- Bubble size: Department size
- Color: Performance rating

### Interactive Features

#### Drill-Through Pages
Create detailed pages for:
1. **Employee Details**
   - Right-click any visual
   - Drill through → Employee Details
   - Shows: Profile, history, metrics

2. **Department Deep Dive**
   - Comprehensive department stats
   - Team composition
   - Budget vs actuals

#### Bookmarks for Scenarios
1. **Current State**: Default view
2. **Hiring Plan**: Show projections
3. **Diversity Focus**: Highlight DEI metrics
4. **Executive Summary**: Key metrics only

---

## 🎨 Module 6: Advanced HR Analytics

### Predictive Analytics

#### Employee Attrition Prediction
```dax
Attrition Risk Score = 
VAR TenureScore = IF([TenureYears] < 2, 3, IF([TenureYears] < 5, 2, 1))
VAR PerformanceScore = IF([LastRating] < 3, 3, 1)
VAR SalaryScore = IF([CompaRatio] < 0.85, 3, IF([CompaRatio] < 0.95, 2, 1))
VAR ManagerChangeScore = IF([ManagerChanges12Mo] > 1, 3, 1)
RETURN
    (TenureScore + PerformanceScore + SalaryScore + ManagerChangeScore) / 4
```

### Time Intelligence for HR

#### YTD and Rolling Calculations
```dax
// YTD Hires
YTD Hires = 
CALCULATE(
    COUNT(FactRecruitment[HireID]),
    DATESYTD(DimDate[Date], "9/30")  // Federal FY
)

// Rolling 12 Month Turnover
Rolling 12Mo Turnover = 
CALCULATE(
    [Turnover Rate],
    DATESINPERIOD(
        DimDate[Date],
        LASTDATE(DimDate[Date]),
        -12,
        MONTH
    )
)
```

### What-If Analysis

#### Salary Planning Parameter
```dax
// Create Parameter
Salary Increase % = 
    GENERATESERIES(0, 0.10, 0.01)

// Apply to Measure
Projected Payroll = 
    SUMX(
        DimEmployee,
        DimEmployee[CurrentSalary] * (1 + [Salary Increase % Value])
    )
```

---

## 📱 Module 7: Power BI Service & Sharing

### Publishing to Power BI Service

1. **File** → **Publish** → Select workspace
2. Choose "HR Analytics" workspace
3. Configure dataset settings:
   - Schedule refresh (daily 6 AM)
   - Gateway connection
   - Credentials

### Creating HR Apps

#### Package Reports as App
1. Workspace → Create app
2. App name: "HR Analytics Suite"
3. Navigation:
   - Executive Dashboard
   - Recruitment Analytics
   - Diversity & Inclusion
   - Compensation Analysis

### Row-Level Security (RLS)

#### Implement Manager View
```dax
[ManagerEmail] = USERPRINCIPALNAME()
    || [HRRole] = "Admin"
```

#### Test Security
1. Modeling → Manage roles
2. Create roles: HR Admin, Manager, Employee
3. Test as user → Verify filtered data

---

## 📊 Module 8: HR Report Templates

### Template 1: Recruitment Dashboard

**Visuals Include**:
- Funnel: Application → Interview → Offer → Hire
- Time to Fill by Position
- Source Effectiveness
- Candidate Pipeline
- Diversity in Hiring

### Template 2: Learning & Development

**Key Metrics**:
- Training Completion Rates
- Skill Gap Analysis
- Training ROI
- Compliance Status
- Learning Hours per Employee

### Template 3: Compensation Analytics

**Components**:
- Salary Distribution
- Compa-Ratios by Level
- Pay Equity Analysis
- Merit Increase Impact
- Total Compensation Breakdown

---

## 🔧 Module 9: Best Practices & Governance

### Performance Optimization

**Do's**:
- ✅ Import only needed columns
- ✅ Use measures instead of calculated columns
- ✅ Aggregate data at source
- ✅ Remove unnecessary visuals
- ✅ Optimize DAX formulas

**Don'ts**:
- ❌ Import entire databases
- ❌ Use bi-directional filters everywhere
- ❌ Create complex visuals with >1M rows
- ❌ Nest too many IFs in DAX
- ❌ Ignore query folding

### HR Data Governance

#### Naming Conventions
```
Measures: [MeasureName]
Columns: ColumnName
Tables: dimTableName or factTableName
Parameters: prmParameterName
```

#### Documentation Standards
- Measure descriptions
- Data source documentation
- Refresh schedule notes
- Change log maintenance

---

## 🚀 Module 10: Integration & Automation

### Power BI + Power Automate

#### Automated Alerts
```yaml
Trigger: Data refresh completed
Condition: Turnover Rate > 15%
Actions:
  1. Send email to HR Director
  2. Post to Teams channel
  3. Create Planner task
  4. Log in SharePoint list
```

### Embedded Analytics

#### SharePoint Integration
1. Edit SharePoint page
2. Add → Power BI web part
3. Select report
4. Configure size and interactivity

#### Teams Integration
1. Teams channel → Add tab
2. Power BI → Select report
3. Pin for easy access

### Mobile Optimization

**Design Considerations**:
- Create phone layout
- Limit visuals per page
- Use large fonts (min 12pt)
- Test touch interactions
- Optimize load times

---

## 📚 Additional Resources

### Learning Paths
1. [Microsoft Learn - Power BI](https://learn.microsoft.com/power-bi)
2. [DAX Patterns](https://daxpatterns.com)
3. [Power BI Community](https://community.powerbi.com)

### HR-Specific Resources
- SHRM Analytics Resources
- Federal HR Data Standards
- OPM Reporting Guidelines

### Sample Datasets
- Adventure Works HR
- Contoso HR Analytics
- Federal Employee Viewpoint Survey

---

## 🎓 Certification Path

1. **PL-300**: Microsoft Power BI Data Analyst
2. **DA-100**: Analyzing Data with Power BI (retired but valuable)
3. **DP-500**: Azure Enterprise Data Analyst

---

**Quick Actions**:
- 📥 Download Power BI Desktop
- 📊 Import your HR data
- 🎨 Build your first dashboard
- 📤 Share with your team