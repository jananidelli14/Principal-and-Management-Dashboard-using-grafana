# State-Level Hackathon Analytics Dashboard (Principal / Management View)

## Project Overview
This project presents a comprehensive analytics dashboard developed using Grafana to evaluate a state-level hackathon from a Principal or institutional management perspective. The dashboard is designed to support academic leadership in understanding student performance, participation outcomes, mentoring effectiveness, and institutional readiness through clear, data-driven insights.

The primary objective of this dashboard is not only to report metrics, but to assist decision-making by highlighting strengths, identifying areas requiring intervention, and enabling state-level benchmarking across colleges.

---

## Dashboard Objectives
- Provide an executive-level snapshot of hackathon participation and outcomes
- Identify top-performing students and academic units
- Classify students based on skill levels and academic readiness
- Evaluate departmental and faculty mentoring impact
- Enable fair, state-level comparison of colleges
- Offer a detailed drill-down view for transparency and review

---

## Design Philosophy
The dashboard follows a **monochromatic visual design approach**, using a single, consistent color palette across all panels. This design choice was intentionally made to maintain visual uniformity, reduce cognitive load, and ensure a professional, executive-level appearance suitable for academic leadership and formal evaluation environments.

The focus of the design is clarity, consistency, and interpretability rather than decorative visuals.

---

## Dashboard Panels and Insights

### 1. Principal-Level KPI Overview
These panels provide an immediate high-level snapshot of institutional performance:
- **Total Participation Reach** – Overall student participation across the selected college and academic year.
- **Average Package (LPA)** – Average placement package achieved by participating students.
- **Hackathon Project Completion Rate** – Percentage of successfully completed hackathon projects.
- **Lab & Software Utilization** – Average utilization of institutional lab and software resources.

---

### 2. Student Performance and Talent Identification
These panels focus on individual student outcomes and academic strength:
- **Top 10 Student Performers** – Bar chart highlighting the highest-performing students based on problem-solving scores.
- **Student Performance Segmentation by Skill Level** – Tabular classification of students into Elite, Pro, Intermediate, and Beginner categories.
- **Hackathon Impact on Student Academic Readiness** – Readiness analysis categorizing students as Ready for Advanced Opportunities, Moderately Prepared, or Needing Further Training.

---

### 3. Department and Faculty Insights
These panels assess academic unit and mentoring effectiveness:
- **Top-10 Performing Departments** – Ranking of departments based on average student performance.
- **Faculty Mentorship by Department** – Mentor impact analysis derived from student performance outcomes.

---

### 4. Diversity and Participation Analysis
- **Gender Participation Ratio** – Visualization of male and female participation distribution in the hackathon.

---

### 5. State-Level Benchmarking
- **Top-3 Colleges** – A filter-independent panel benchmarking the best-performing colleges at the state level. This panel remains constant to ensure fair comparison across institutions.

---

### 6. Detailed Drill-Down View
- **Hackathon Drill-Down Table** – A comprehensive table providing department-wise and year-wise details, including participation, performance scores, placements, resource utilization, and tools used. This panel supports audit, validation, and in-depth review.

---

## Filters and Interactivity
The dashboard supports dynamic exploration using the following global filters:
- College
- Department
- Academic Year
- Student
- Mentor

These filters allow principals and administrators to analyze both high-level summaries and detailed records specific to their institution.

---

## Technology Stack
- Grafana for interactive dashboard visualization
- PostgreSQL as the analytical data source
- SQL for data aggregation and analytical logic
- CSV-based synthetic dataset representing hackathon participation and outcomes

---

## Use Cases
This dashboard is suitable for:
- Academic principals and institutional leadership
- Hackathon evaluation and review committees
- Department-level academic planning
- Educational analytics and visualization projects
- Portfolio demonstration of applied data analytics skills

---

## Repository Contents
- Dataset used for analysis
- Exported Grafana dashboard JSON
- SQL queries used for panel generation
- Dashboard screenshots for reference and documentation

---

## Author
Janani D
Linkedin: https://www.linkedin.com/in/janani-d-157204361/
